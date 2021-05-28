package matmul

import chisel3._
import chisel3.util.isPow2

/** Pipelined DotProduct based on MAC and PipeAdder */
//noinspection TypeAnnotation
class DotProduct(bitWidth: Int = 8, size: Int = 16) extends Module {
  val errorMsg =
    s"\n\n[VTA] [DotProduct] size must be greater than 4 and a power of 2\n\n"
  require(size >= 2 && isPow2(size), errorMsg)

  val macs = Seq.fill(size)(Module(new MAC(bitWidth, cBits = 1))) // # of total vector pairs
  val summer = Module(new LogSum(macs.head.outBits, size))
  val outBits = summer.outBits
  val io = IO(new Bundle {
    val a = Input(Vec(size, SInt(bitWidth.W)))
    val b = Input(Vec(size, SInt(bitWidth.W)))
    val y = Output(SInt(outBits.W))
  })
  // Vector MACs
  for (i <- 0 until size) {
    macs(i).io.a := io.a(i)
    macs(i).io.b := io.b(i)
    macs(i).io.c := 0.S

    summer.io.inVec(i) := macs(i).io.y
  }
  io.y := summer.io.y
}

class Matrix(rows: Int, cols: Int, bitWidth: Int) extends Bundle {
  val data: Vec[Vec[SInt]] = Vec(rows, Vec(cols, SInt(bitWidth.W)))
}

class Valid[+T <: Data](gen: T) extends Bundle {
  val valid: Bool = Output(Bool())
  val data:  T = Output(gen)

  override def cloneType: this.type = Valid(gen).asInstanceOf[this.type]
}

object Valid {
  def apply[T <: Data](gen: T): Valid[T] = new Valid(gen)
}

// TODO: output width is wrong (will overflow)
//noinspection TypeAnnotation
class MatrixVectorProduct(rows: Int, cols: Int, bitWidth: Int) extends Module {
  val io = IO(new Bundle {
    val mat = Input(new Matrix(rows, cols, bitWidth))
    val vec = Input(Vec(cols, SInt(bitWidth.W)))
    val out = Output(Vec(rows, SInt(bitWidth.W)))
  })

  val dot = Seq.fill(rows)(Module(new DotProduct(bitWidth, cols)))

  for (i <- 0 until rows) {
    for (j <- 0 until cols) {
      dot(i).io.a(j) := io.mat.data(i)(j) // input vector
      dot(i).io.b(j) := io.vec(j)
    }
    io.out(i) := dot(i).io.y
  }
}

/** Perform (NXM)(MXR) -> (NXR) matrix-matrix-multiplication based on MatrixVectorProduct */
//noinspection TypeAnnotation
class MatrixMatrixProduct(N: Int, M: Int, R: Int, bitWidth: Int) extends Module {
  val io = IO(new Bundle {
    // out = A * B
    val A = Input(new Matrix(N, M, bitWidth))
    val B = Input(new Matrix(M, R, bitWidth))
    val out = Output(new Matrix(N, R, bitWidth))
  })

  var matVecMul = Seq.fill(R)(Module(new MatrixVectorProduct(N, M, bitWidth)))

  for (i <- 0 until R) {
    matVecMul(i).io.mat <> io.A
    for (j <- 0 until M) {
      matVecMul(i).io.vec(j) := io.B.data(j)(i)
    }
    for (j <- 0 until N) {
      io.out.data(j)(i) := matVecMul(i).io.out(j)
    }
  }
}

//noinspection TypeAnnotation
class FrobeniusInnerProduct(rows: Int, cols: Int, bitWidth: Int) extends Module {
  val dot:    Seq[DotProduct] = Seq.fill(rows)(Module(new DotProduct(bitWidth, cols)))
  val summer: LogSum = Module(new LogSum(dot.head.outBits, rows))

  val io = IO(new Bundle {
    val A = Input(new Matrix(rows, cols, bitWidth))
    val B = Input(new Matrix(rows, cols, bitWidth))
    val y = Output(SInt(summer.outBits.W))
  })

  for (i <- 0 until rows) {
    for (j <- 0 until cols) {
      dot(i).io.a(j) := io.A.data(i)(j)
      dot(i).io.b(j) := io.B.data(i)(j)
    }
    summer.io.inVec(i) := dot(i).io.y
  }
  io.y := summer.io.y
}
