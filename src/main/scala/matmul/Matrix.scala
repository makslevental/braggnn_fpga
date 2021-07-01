package matmul

import chisel3._
import chisel3.util.isPow2

/** Pipelined DotProduct based on MAC and PipeAdder */
//noinspection TypeAnnotation
class DotProduct[T <: Bits](val dtype: T, size: Int = 16) extends Module {
  val errorMsg =
    s"\n\n[VTA] [DotProduct] size must be greater than 4 and a power of 2\n\n"
  require(size >= 2 && isPow2(size), errorMsg)

  val macs = Seq.fill(size)(Module(new MAC(dtype.getWidth, cBits = 1))) // # of total vector pairs
  val summer = Module(new LogSum(macs.head.outBits, size))
  val outBits = summer.outBits
  val io = IO(new Bundle {
    val a = Input(Vec(size, dtype.cloneType))
    val b = Input(Vec(size, dtype.cloneType))
    val y = Output(UInt(outBits.W))
  })
  // Vector MACs
  for (i <- 0 until size) {
    macs(i).io.a := io.a(i)
    macs(i).io.b := io.b(i)
    macs(i).io.c := 0.U

    summer.io.inVec(i) := macs(i).io.y
  }
  io.y := summer.io.y
}

class Matrix[T <: Bits](val dtype: T, rows: Int, cols: Int) extends Bundle {
  val data: Vec[Vec[T]] = Vec(rows, Vec(cols, dtype.cloneType))
}

//class Valid[+T <: Data](gen: T) extends Bundle {
//  val valid: Bool = Output(Bool())
//  val data: T     = Output(gen)
//
//  override def cloneType: this.type = Valid(gen).asInstanceOf[this.type]
//}
//
//object Valid {
//  def apply[T <: Data](gen: T): Valid[T] = new Valid(gen)
//}

// TODO: output width is wrong (will overflow)
//noinspection TypeAnnotation
class MatrixVectorProduct[T <: Bits](val dtype: T, rows: Int, cols: Int) extends Module {
  val io = IO(new Bundle {
    val mat = Input(new Matrix(dtype, rows, cols))
    val vec = Input(Vec(cols, dtype.cloneType))
    val out = Output(Vec(rows, dtype.cloneType))
  })

  val dot = Seq.fill(rows)(Module(new DotProduct(dtype, cols)))

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
class MatrixMatrixProduct[T <: Bits](val dtype: T, N: Int, M: Int, R: Int) extends Module {
  val io = IO(new Bundle {
    // out = A * B
    val A = Input(new Matrix(dtype, N, M))
    val B = Input(new Matrix(dtype, M, R))
    val out = Output(new Matrix(dtype, N, R))
  })

  var matVecMul = Seq.fill(R)(Module(new MatrixVectorProduct(dtype, N, M)))

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
class FrobeniusInnerProduct[T <: Bits](val dtype: T, rows: Int, cols: Int) extends Module {
  val dot:    Seq[DotProduct[T]] = Seq.fill(rows)(Module(new DotProduct(dtype, cols)))
  val summer: LogSum = Module(new LogSum(dot.head.outBits, rows))

  val io = IO(new Bundle {
    val A = Input(new Matrix(dtype, rows, cols))
    val B = Input(new Matrix(dtype, rows, cols))
    val y = Output(UInt(summer.outBits.W))
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
