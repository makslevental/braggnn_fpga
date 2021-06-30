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
      c.io.outData.ready.poke(false.B)
      for (j <- 0 until entriesIn) {
        c.io.inData.bits(j).poke((j + 1).U)
      }

      c.clock.step()

      c.io.inData.valid.poke(false.B)
      c.io.outData.ready.poke(true.B)
      for (i <- 0 until repeats * entriesIn) {
//        println(
//          s"idx ${i % entriesIn} valid ${c.io.outData.valid.peek().litValue()} c.io.output.bits ${c.io.outData.bits(0).peek().litValue()}"
//        )
        c.io.outData.valid.expect(true.B)
        c.io.outData.bits(0).expect((i % entriesIn + 1).U)
        c.clock.step()
      }
    }
  }

  it should "not rotate when not ready" in {
    test(new RingBuffer(UInt(dWidth.W), entriesIn)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
      c.io.outData.ready.poke(false.B)
      c.io.inData.valid.poke(true.B)
      for (j <- 0 until entriesIn) {
        c.io.inData.bits(j).poke((j + 1).U)
      }

      c.clock.step()

      c.io.inData.valid.poke(false.B)
      c.io.outData.ready.poke(false.B)
      for (i <- 0 until repeats * entriesIn) {
//        println(
//          s"idx ${i % entriesIn} valid ${c.io.outData.valid.peek().litValue()} c.io.output.bits ${c.io.outData.bits(0).peek().litValue()}"
//        )
        c.io.outData.valid.expect(true.B)
        c.io.outData.bits(0).expect(1.U)
        c.clock.step()
      }
    }
  }

  it should "update" in {
    test(new RingBuffer(UInt(dWidth.W), entriesIn)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
      for (i <- 0 until repeats) {
        c.io.outData.ready.poke(false.B)
        c.io.inData.valid.poke(true.B)
        for (j <- 0 until entriesIn) {
          c.io.inData.bits(j).poke((i * entriesIn + j + 1).U)
        }

        c.clock.step()

        c.io.inData.valid.poke(false.B)
        c.io.outData.ready.poke(true.B)

        for (j <- 0 until entriesIn) {
//          println(
//            s"idx ${j % entriesIn} valid ${c.io.outData.valid.peek().litValue()} c.io.output.bits ${c.io.outData.bits(0).peek().litValue()}"
//          )
          c.io.outData.valid.expect(true.B)
          c.io.outData.bits(0).expect((i * entriesIn + j + 1).U)
          c.clock.step()
        }
//        println("**********")
      }
    }
  }

}
