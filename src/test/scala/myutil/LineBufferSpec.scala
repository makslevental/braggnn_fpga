package myutil

import chisel3._
import chiseltest._
import chiseltest.experimental.TestOptionBuilder.ChiselScalatestOptionBuilder
import org.scalatest._
import treadle.WriteVcdAnnotation

class LineBufferSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("LineBuffer")

  val repeats = 10
  val dWidth = 32
  val rowsOut = 3
  val colsIn = 8

  it should "rotate one row" in {
    test(new LineBuffer(UInt(dWidth.W), colsIn, rowsOut)) { c =>
      c.io.inData.valid.poke(true.B)
      for (i <- 0 until colsIn) {
        c.io.inData.bits(i).poke((i + 1).U)
      }

      c.clock.step()
      c.io.inData.valid.poke(false.B)

      for (r <- 0 until repeats) {
        for (i <- 0 until colsIn) {
          c.io.outData.bits(r % rowsOut).expect((i + 1).U)
//          c.io.outData.bits.foreach(r => print(f"${r.peek().litValue()}%5s"))
//          println
          c.clock.step()
        }
//        println("***********")
      }
    }
  }

  val testImg = List.tabulate(repeats, colsIn) { (r, c) =>
    r * colsIn + c + 1
  }

  it should "rotate many rows" in {
    test(new LineBuffer(UInt(dWidth.W), colsIn, rowsOut)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
      for (repeat <- 0 until repeats) {
        c.io.inData.valid.poke(true.B)
        for (i <- 0 until colsIn) {
          c.io.inData.bits(i).poke((colsIn * repeat + i + 1).U)
        }

        c.clock.step()
        c.io.inData.valid.poke(false.B)

        for (i <- 0 until colsIn) {
//          println(s"${c.io.outData.valid.peek().litValue()}")
//          c.io.outData.bits.foreach(r => print(f"${r.peek().litValue()}%5s"))
//          println
          for (j <- 0 until rowsOut) {
            c.io.outData.bits(j).expect(math.max(testImg(repeat)(i) - j * colsIn, 0).U)
          }
          c.clock.step()
        }
//        println("*********")
      }
    }
  }

}
