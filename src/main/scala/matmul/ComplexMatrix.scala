package matmul

import chisel3._
import chisel3.experimental.FixedPoint
import chisel3.stage.ChiselStage
import chisel3.util.{isPow2, log2Ceil}

import scala.math.pow

class Complex(width: Int) extends Bundle {
  var real = FixedPoint(width.W, 4.BP)
  var imag = FixedPoint(width.W, 4.BP)
}

class ComplexAdd(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(new Complex(width))
    val b = Input(new Complex(width))
    val c = Output(new Complex(width))
  })

  io.c.real := io.a.real + io.b.real
  io.c.imag := io.a.imag + io.b.imag
}

class ComplexMult(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(new Complex(width))
    val b = Input(new Complex(width))
    val c = Output(new Complex(width))
  })

  val a = io.a.real
  val b = io.a.imag
  val c = io.b.real
  val d = io.b.imag

  val ac = a * c; val bd = b * d; val ad = a * d; val bc = b * c;
  io.c.real := ac - bd
  io.c.imag := ad + bc
}

class ComplexLogSum(bitWidth: Int = 8, size: Int = 16) extends Module {
  val errorMsg =
    s"\n\n[VTA] [DotProduct] size must be greater than 4 and a power of 2\n\n"
  require(size >= 2 && isPow2(size), errorMsg)

  val b = 2 * bitWidth
  val outBits = b + log2Ceil(size) + 1
  val io = IO(new Bundle {
    val inVec = Input(Vec(size, new Complex(bitWidth)))
    val y = Output(new Complex(outBits))
  })

  val adders = Seq.tabulate(log2Ceil(size / 2) + 1)(i => {
    val s = pow(2, log2Ceil(size) - (i + 1)).toInt
    Seq.fill(s)(
      if (i == 0)
        Left(Module(new ComplexAdd(width = b + i + 1)))
      else
        Right(Module(new ComplexAdd(width = b + i + 1)))
    )
  }) // # adders within each layer

  // PipeAdder Reduction
  for (i <- adders.indices) {
    for (j <- adders(i).indices) {
      // this is so stupid
      // all because of this depr https://github.com/freechipsproject/chisel3/pull/1550
      adders(i)(j) match {
        case Left(pipeAdder: ComplexAdd) =>
          pipeAdder.io.a := io.inVec(2 * j)
          pipeAdder.io.b := io.inVec(2 * j + 1)
        case Right(adder) =>
          adders(i - 1)(2 * j) match {
            case Left(twojadder: ComplexAdd) =>
              adders(i - 1)(2 * j + 1) match {
                case Left(twojadderp1: ComplexAdd) =>
                  adder.io.a := twojadder.io.c
                  adder.io.b := twojadderp1.io.c
                case Right(twojadderp1: ComplexAdd) =>
                  adder.io.a := twojadder.io.c
                  adder.io.b := twojadderp1.io.c
              }
            case Right(twojadder: ComplexAdd) =>
              adders(i - 1)(2 * j + 1) match {
                case Left(twojadderp1: ComplexAdd) =>
                  adder.io.a := twojadder.io.c
                  adder.io.b := twojadderp1.io.c
                case Right(twojadderp1: ComplexAdd) =>
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

class CMAC(bitWidth: Int = 8, cBits: Int = 16) extends Module {
  val b = 2 * bitWidth
  val outBits = Math.max(b, cBits) + 1
  val io = IO(new Bundle {
    val a = Input(new Complex(bitWidth))
    val b = Input(new Complex(bitWidth))
    val c = Input(new Complex(cBits))
    val y = Output(new Complex(outBits))
  })
  val mult = Module(new ComplexMult(b))
  val add = Module(new ComplexAdd(outBits))

  val rA = RegNext(io.a)
  val rB = RegNext(io.b)
  val rC = RegNext(io.c)

  mult.io.a := rA
  mult.io.b := rB

  add.io.a := rC
  add.io.b := mult.io.c

  io.y := add.io.c
}

class ComplexDotProduct(bitWidth: Int = 8, size: Int = 16) extends Module {
  val errorMsg =
    s"\n\n[VTA] [DotProduct] size must be greater than 4 and a power of 2\n\n"
  require(size >= 2 && isPow2(size), errorMsg)

  val macs = Seq.fill(size)(Module(new CMAC(bitWidth, cBits = 1))) // # of total vector pairs
  val summer = Module(new ComplexLogSum(macs.head.outBits, size))
  val outBits = summer.outBits
  val io = IO(new Bundle {
    val a = Input(Vec(size, new Complex(bitWidth)))
    val b = Input(Vec(size, new Complex(bitWidth)))
    val y = Output(new Complex(outBits))
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

class ComplexMatrix(rows: Int, cols: Int, bitWidth: Int) extends Bundle {
  val data: Vec[Vec[Complex]] = Vec(rows, Vec(cols, new Complex(bitWidth)))
}

class ComplexMatrixVectorProduct(rows: Int, cols: Int, bitWidth: Int) extends Module {
  val io = IO(new Bundle {
    val mat = Input(new ComplexMatrix(rows, cols, bitWidth))
    val vec = Input(Vec(cols, new Complex(bitWidth)))
    val out = Output(Vec(rows, new Complex(bitWidth)))
  })

  val dot = Seq.fill(rows)(Module(new ComplexDotProduct(bitWidth, cols)))

  for (i <- 0 until rows) {
    for (j <- 0 until cols) {
      dot(i).io.a(j) := io.mat.data(i)(j) // input vector
      dot(i).io.b(j) := io.vec(j)
    }
    io.out(i) := dot(i).io.y
  }
}

class ComplexMatrixMatrixProduct(N: Int, M: Int, R: Int, bitWidth: Int) extends Module {
  val io = IO(new Bundle {
    // out = A * B
    val A = Input(new ComplexMatrix(N, M, bitWidth))
    val B = Input(new ComplexMatrix(M, R, bitWidth))
    val out = Output(new ComplexMatrix(N, R, bitWidth))
  })

  var matVecMul = Seq.fill(R)(Module(new ComplexMatrixVectorProduct(N, M, bitWidth)))

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

object ComplexMatrixMatrixProduct extends App {
  val rows = 4
  val cols = 4
  (new ChiselStage).emitVerilog(new ComplexMatrixMatrixProduct(rows, cols, rows, 32), args)
}
