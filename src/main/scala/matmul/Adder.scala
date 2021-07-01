package matmul

import chisel3._
import chisel3.util.{isPow2, log2Ceil}

import scala.math.pow

/** Pipelined multiply and accumulate */
//noinspection TypeAnnotation
class MAC(bitWidth: Int = 8, cBits: Int = 16) extends Module {
  val b = 2 * bitWidth
  val outBits = Math.max(b, cBits) + 1
  val io = IO(new Bundle {
    val a = Input(UInt(bitWidth.W))
    val b = Input(UInt(bitWidth.W))
    val c = Input(UInt(cBits.W))
    val y = Output(UInt(outBits.W))
  })
  val mult = Wire(UInt(b.W))
  val add = Wire(UInt(outBits.W))
  val rA = RegNext(io.a)
  val rB = RegNext(io.b)
  val rC = RegNext(io.c)

  mult := rA * rB
  add := rC +& mult

  io.y := add
}

/** PipeAdder
  *
  * This unit loads input bits into register and performs addition in the next cycle
  */
//noinspection TypeAnnotation
class PipeAdder(bitWidth: Int = 8) extends Module {
  val outBits = bitWidth + 1
  val io = IO(
    new Bundle {
      val a = Input(UInt(bitWidth.W))
      val b = Input(UInt(bitWidth.W))
      val y = Output(UInt(outBits.W))
    }
  )

  val add = Wire(UInt(outBits.W))
  val rA = RegNext(io.a)
  val rB = RegNext(io.b)
  add := rA +& rB
  io.y := add
}

/** Adder
  *
  * This unit wires input bits to an adder directly.
  * The output comes out of combinational logic without waiting for another cycle.
  */
//noinspection TypeAnnotation
class Adder(bitWidth: Int = 8) extends Module {
  val outBits = bitWidth + 1
  val io = IO(new Bundle {
    val a = Input(UInt(bitWidth.W))
    val b = Input(UInt(bitWidth.W))
    val y = Output(UInt(outBits.W))
  })
  val add = Wire(UInt(outBits.W))
  val rA = Wire(UInt(bitWidth.W))
  val rB = Wire(UInt(bitWidth.W))
  rA := io.a
  rB := io.b
  add := rA +& rB
  io.y := add
}

class LogSum(bitWidth: Int = 8, size: Int = 16) extends Module {
  val errorMsg =
    s"\n\n[VTA] [DotProduct] size must be greater than 4 and a power of 2\n\n"
  require(size >= 2 && isPow2(size), errorMsg)

  val b = 2 * bitWidth
  val outBits = b + log2Ceil(size) + 1
  val io = IO(new Bundle {
    val inVec = Input(Vec(size, UInt(bitWidth.W)))
    val y = Output(UInt(outBits.W))
  })

  val adders = Seq.tabulate(log2Ceil(size / 2) + 1)(i => {
    val s = pow(2, log2Ceil(size) - (i + 1)).toInt
    Seq.fill(s)(
      if (i == 0)
        Left(Module(new PipeAdder(bitWidth = b + i + 1)))
      else
        Right(Module(new Adder(bitWidth = b + i + 1)))
    )
  }) // # adders within each layer

  // PipeAdder Reduction
  for (i <- adders.indices) {
    for (j <- adders(i).indices) {
      // this is so stupid
      // all because of this depr https://github.com/freechipsproject/chisel3/pull/1550
      adders(i)(j) match {
        case Left(pipeAdder: PipeAdder) =>
          pipeAdder.io.a := io.inVec(2 * j)
          pipeAdder.io.b := io.inVec(2 * j + 1)
        case Right(adder) =>
          adders(i - 1)(2 * j) match {
            case Left(twojadder: PipeAdder) =>
              adders(i - 1)(2 * j + 1) match {
                case Left(twojadderp1: PipeAdder) =>
                  adder.io.a := twojadder.io.y
                  adder.io.b := twojadderp1.io.y
                case Right(twojadderp1: Adder) =>
                  adder.io.a := twojadder.io.y
                  adder.io.b := twojadderp1.io.y
              }
            case Right(twojadder: Adder) =>
              adders(i - 1)(2 * j + 1) match {
                case Left(twojadderp1: PipeAdder) =>
                  adder.io.a := twojadder.io.y
                  adder.io.b := twojadderp1.io.y
                case Right(twojadderp1: Adder) =>
                  adder.io.a := twojadder.io.y
                  adder.io.b := twojadderp1.io.y
              }
          }
      }
    }
  }

  // last adder
  adders.last.head match {
    case Left(adder) =>
      // this should not be possible
      io.y := adder.io.y
    case Right(adder) =>
      io.y := adder.io.y
  }

}
