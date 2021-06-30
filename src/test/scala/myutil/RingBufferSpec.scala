package myutil

import chisel3._
import chisel3.tester.experimental.TestOptionBuilder._
import chiseltest._
import org.scalatest._
import treadle.WriteVcdAnnotation

class RingBufferSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("RingBuffer")

  val repeats = 5
  val dWidth = 32
  val entriesIn = 12

  it should "rotate" in {
    test(new RingBuffer(UInt(dWidth.W), entriesIn)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
      c.io.inData.valid.poke(true.B)
      for (j <- 0 until entriesIn) {
        c.io.inData.bits(j).poke((j + 1).U)
      }
      c.clock.step()
      c.io.inData.valid.poke(false.B)
      for (i <- 0 until repeats * entriesIn) {
        println(s"${i % entriesIn} c.io.output.bits ${c.io.outData.bits(0).peek().litValue()}")
        c.clock.step()
      }
    }
  }

  it should "update" in {
    test(new RingBuffer(UInt(dWidth.W), entriesIn)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
      for (i <- 0 until repeats * entriesIn) {
        // if reading from last entry then write new entries
        if (i % entriesIn == 0) {
          c.io.inData.valid.poke(true.B)
          for (j <- 0 until entriesIn) {
            c.io.inData.bits(j).poke((i + j + 1).U)
          }
        } else {
          c.io.inData.valid.poke(false.B)
        }
        println(s"${i % entriesIn} c.io.output.bits ${c.io.outData.bits(0).peek().litValue()}")
        c.clock.step()
      }
    }
  }

}
