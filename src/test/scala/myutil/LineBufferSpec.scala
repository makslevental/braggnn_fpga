package myutil

import chisel3._
import chiseltest._
import chiseltest.experimental.TestOptionBuilder.ChiselScalatestOptionBuilder
import org.scalatest._
import treadle.WriteVcdAnnotation

class LineBufferSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("LineBuffer")

  val repeats = 5
  val dWidth = 32
  val rowsOut = 3
  val colsIn = 8

  it should "rotate" in {
    test(new LineBuffer(UInt(dWidth.W), colsIn, rowsOut)) { c =>
//      util.debug(c.io.inData.valid.peek().litValue(), "on init")
//      util.debug(c.io.outData.valid.peek().litValue(), "on init")
      c.io.inData.valid.poke(true.B)
//      util.debug(c.io.inData.valid.peek().litValue(), "after indata is valid")
//      util.debug(c.io.outData.valid.peek().litValue(), "after indata is valid")
      for (i <- 0 until colsIn) {
        c.io.inData.bits(i).poke((i + 1).U)
      }

      c.clock.step()
      util.debug(c.io.outData.valid.peek().litValue())
      c.io.inData.valid.poke(false.B)
      util.debug(c.io.outData.valid.peek().litValue())

      for (_ <- 0 until repeats * colsIn) {
        c.io.outData.bits.foreach(r => print(f"${r.peek().litValue()}%5s"))
        println
        c.clock.step()
      }

    }
  }

  it should "update" in {
    test(new LineBuffer(UInt(dWidth.W), colsIn, rowsOut)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
      for (row <- 0 until 100) {
//        util.debug(c.io.outData.valid.peek().litValue(), "on init")
        c.io.inData.valid.poke(true.B)
//        util.debug(c.io.outData.valid.peek().litValue(), "after indata is valid")
        for (i <- 0 until colsIn) {
          c.io.inData.bits(i).poke((colsIn*row + i + 1).U)
        }

        c.clock.step()
//        util.debug(c.io.outData.valid.peek().litValue(), "after writing all data but before valid is false")
        c.io.inData.valid.poke(false.B)
//        util.debug(c.io.outData.valid.peek().litValue(), "after writing all data after valid is false")

        for (_ <- 0 until colsIn) {
          c.io.outData.bits.foreach(r => print(f"${r.peek().litValue()}%5s"))
          println
          c.clock.step()
        }
//        util.debug(c.io.outData.valid.peek().litValue(), "after reading all data")
      }
    }
  }

}
