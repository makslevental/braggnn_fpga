package myutil

import chisel3._
import chiseltest._
import org.scalatest._

class LineBufferSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("LineBuffer")

  val repeats = 20
  val dWidth = 32
  val rowsOut = 5
  val colsIn = 12
  val colsOut = 3

  it should "should rotate" in {
    test(new LineBuffer(UInt(dWidth.W), colsIn, rowsOut, colsOut)) { c =>
      c.io.inData.valid.poke(true.B)
      for (i <- 0 until colsIn) {
        c.io.inData.bits(i).poke((i + 1).U)
        //          c.io.inData.bits(i).poke((row * colsIn + i + 1).U)
      }
//      println((0 until rowsOut).map(c.io.outData(_).peek().litValue()))
      c.clock.step()
      c.io.inData.valid.poke(false.B)

      for (_ <- 0 until repeats * colsIn) {
        println((0 until rowsOut).map(c.io.outData(_).peek().litValue()))
        c.clock.step()
      }

    }
  }

  it should "should update" in {
    test(new LineBuffer(UInt(dWidth.W), colsIn, rowsOut, colsOut)) { c =>
      for (row <- 0 until 10) {
        c.io.inData.valid.poke(true.B)
        for (i <- 0 until colsIn) {
          c.io.inData.bits(i).poke((row + 1).U)
//          c.io.inData.bits(i).poke((row * colsIn + i + 1).U)
        }
//        println((0 until rowsOut).map(c.io.outData(_).peek().litValue()))
        c.clock.step()
        c.io.inData.valid.poke(false.B)

        for (_ <- 0 until colsIn) {
          println((0 until rowsOut).map(c.io.outData(_).peek().litValue()))
          c.clock.step()
        }
      }
    }
  }

}
