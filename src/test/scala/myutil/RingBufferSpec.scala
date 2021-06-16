package myutil

import chisel3._
import chiseltest._
import org.scalatest._

class RingBufferSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("RingBuffer")

  val repeats = 5
  val dWidth = 32
  val entriesIn = 12

  it should "should rotate" in {
    test(new RingBuffer(UInt(dWidth.W), entriesIn)) { c =>
      c.io.inData.valid.poke(true.B)
      for (j <- 0 until entriesIn) {
        c.io.inData.bits(j).poke((j + 1).U)
      }
      c.clock.step()
      c.io.inData.valid.poke(false.B)
      c.clock.step(entriesIn - 1)
      for (i <- 0 until repeats * entriesIn) {
        println(s"${i % entriesIn} c.io.output.bits ${c.io.outData(0).peek()}")
        c.clock.step()
      }
    }
  }

  it should "should update" in {
    test(new RingBuffer(UInt(dWidth.W), entriesIn)) { c =>
      for (i <- 0 until repeats * entriesIn) {
        // if reading from last entry then write new entries
        if (i % entriesIn == entriesIn - 1) {
          c.io.inData.valid.poke(true.B)
          for (j <- 0 until entriesIn) {
            c.io.inData.bits(j).poke((i + j + 1).U)
          }
        } else {
          c.io.inData.valid.poke(false.B)
        }
        println(s"${i % entriesIn} c.io.output.bits ${c.io.outData(0).peek()}")
        c.clock.step()
      }
    }
  }

}
