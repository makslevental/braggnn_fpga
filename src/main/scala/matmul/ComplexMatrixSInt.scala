package matmul

import chisel3._
import chisel3.util.{isPow2, log2Ceil}

import scala.math.pow

class ComplexSInt(width: Int) extends Bundle {
  var real = SInt(width.W)
  var imag = SInt(width.W)
}

class ComplexSIntAdd(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(new ComplexSInt(width))
    val b = Input(new ComplexSInt(width))
    val c = Output(new ComplexSInt(width))
  })

  io.c.real := io.a.real + io.b.real
  io.c.imag := io.a.imag + io.b.imag
}

class ComplexSIntMult(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(new ComplexSInt(width))
    val b = Input(new ComplexSInt(width))
    val c = Output(new ComplexSInt(width))
  })

  val a = io.a.real
  val b = io.a.imag
  val c = io.b.real
  val d = io.b.imag

  val ac = a * c; val bd = b * d; val ad = a * d; val bc = b * c;
  io.c.real := ac - bd
  io.c.imag := ad + bc
}

class ComplexSIntLogSum(bitWidth: Int = 8, size: Int = 16) extends Module {
  val errorMsg =
    s"\n\n[VTA] [DotProduct] size must be greater than 4 and a power of 2\n\n"
  require(size >= 2 && isPow2(size), errorMsg)

  val b = 2 * bitWidth
  val outBits = b + log2Ceil(size) + 1
  val io = IO(new Bundle {
    val inVec = Input(Vec(size, new ComplexSInt(bitWidth)))
    val y = Output(new ComplexSInt(outBits))
  })

  val adders = Seq.tabulate(log2Ceil(size / 2) + 1)(i => {
    val s = pow(2, log2Ceil(size) - (i + 1)).toInt
    Seq.fill(s)(
      if (i == 0)
        Left(Module(new ComplexSIntAdd(width = b + i + 1)))
      else
        Right(Module(new ComplexSIntAdd(width = b + i + 1)))
    )
  }) // # adders within each layer

  // PipeAdder Reduction
  for (i <- adders.indices) {
    for (j <- adders(i).indices) {
      // this is so stupid
      // all because of this depr https://github.com/freechipsproject/chisel3/pull/1550
      adders(i)(j) match {
        case Left(pipeAdder: ComplexSIntAdd) =>
          pipeAdder.io.a := io.inVec(2 * j)
          pipeAdder.io.b := io.inVec(2 * j + 1)
        case Right(adder) =>
          adders(i - 1)(2 * j) match {
            case Left(twojadder: ComplexSIntAdd) =>
              adders(i - 1)(2 * j + 1) match {
                case Left(twojadderp1: ComplexSIntAdd) =>
                  adder.io.a := twojadder.io.c
                  adder.io.b := twojadderp1.io.c
                case Right(twojadderp1: ComplexSIntAdd) =>
                  adder.io.a := twojadder.io.c
                  adder.io.b := twojadderp1.io.c
              }
            case Right(twojadder: ComplexSIntAdd) =>
              adders(i - 1)(2 * j + 1) match {
                case Left(twojadderp1: ComplexSIntAdd) =>
                  adder.io.a := twojadder.io.c
                  adder.io.b := twojadderp1.io.c
                case Right(twojadderp1: ComplexSIntAdd) =>
                  adder.io.a := twojadder.io.c
                  adder.io.b := twojadderp1.io.c
              }
          }
      }
    }
  }

  // last adder
  adders.last.head match {
    case Left(adder) =>
      // this should not be possible
      io.y := adder.io.c
    case Right(adder) =>
      io.y := adder.io.c
  }

}

class CSMAC(bitWidth: Int = 8, cBits: Int = 16) extends Module {
  val b = 2 * bitWidth
  val outBits = Math.max(b, cBits) + 1
  val io = IO(new Bundle {
    val a = Input(new ComplexSInt(bitWidth))
    val b = Input(new ComplexSInt(bitWidth))
    val c = Input(new ComplexSInt(cBits))
    val y = Output(new ComplexSInt(outBits))
  })
  val mult = Module(new ComplexSIntMult(b))
  val add = Module(new ComplexSIntAdd(outBits))

  val rA = RegNext(io.a)
  val rB = RegNext(io.b)
  val rC = RegNext(io.c)

  mult.io.a := rA
  mult.io.b := rB

  add.io.a := rC
  add.io.b := mult.io.c

  io.y := add.io.c
}

class ComplexSIntDotProduct(bitWidth: Int = 8, size: Int = 16) extends Module {
  val errorMsg =
    s"\n\n[VTA] [DotProduct] size must be greater than 4 and a power of 2\n\n"
  require(size >= 2 && isPow2(size), errorMsg)

  val macs = Seq.fill(size)(Module(new CSMAC(bitWidth, cBits = 1))) // # of total vector pairs
  val summer = Module(new ComplexSIntLogSum(macs.head.outBits, size))
  val outBits = summer.outBits
  val io = IO(new Bundle {
    val a = Input(Vec(size, new ComplexSInt(bitWidth)))
    val b = Input(Vec(size, new ComplexSInt(bitWidth)))
    val y = Output(new ComplexSInt(outBits))
  })
  // Vector MACs
  for (i <- 0 until size) {
    macs(i).io.a := io.a(i)
    macs(i).io.b := io.b(i)
    macs(i).io.c := DontCare

    summer.io.inVec(i) := macs(i).io.y
  }
  io.y := summer.io.y
}

class ComplexSIntMatrix(rows: Int, cols: Int, bitWidth: Int) extends Bundle {
  val data: Vec[Vec[ComplexSInt]] = Vec(rows, Vec(cols, new ComplexSInt(bitWidth)))
}

class ComplexFixedMatrixVectorProduct(rows: Int, cols: Int, bitWidth: Int) extends Module {
  val io = IO(new Bundle {
    val mat = Input(new ComplexSIntMatrix(rows, cols, bitWidth))
    val vec = Input(Vec(cols, new ComplexSInt(bitWidth)))
    val out = Output(Vec(rows, new ComplexSInt(bitWidth)))
  })

  val dot = Seq.fill(rows)(Module(new ComplexSIntDotProduct(bitWidth, cols)))

  for (i <- 0 until rows) {
    for (j <- 0 until cols) {
      dot(i).io.a(j) := io.mat.data(i)(j) // input vector
      dot(i).io.b(j) := io.vec(j)
    }
    io.out(i) := dot(i).io.y
  }
}

class ComplexSIntMatrixMatrixProduct(N: Int, M: Int, R: Int, bitWidth: Int) extends Module {
  val io = IO(new Bundle {
    // out = A * B
    val A = Input(new ComplexSIntMatrix(N, M, bitWidth))
    val B = Input(new ComplexSIntMatrix(M, R, bitWidth))
    val out = Output(new ComplexSIntMatrix(N, R, bitWidth))
  })

  var matVecMul = Seq.fill(R)(Module(new ComplexFixedMatrixVectorProduct(N, M, bitWidth)))

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
