package dnn

import chisel3._
import chiseltest._
import org.scalatest._

class KernelShiftRegisterSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("KernelShiftRegister")

  val repeats = 20
  val dWidth = 32
  val kSize = 5

  it should "fill" in {
    test(new KernelShiftRegister(UInt(dWidth.W), kSize)) { c =>
      c.io.inData.valid.poke(true.B)

      for (i <- 0 until kSize) {
        c.io.inData.bits(i).poke((i + 1).U)
      }

//      c.io.outData.bits.foreach { row => row.foreach(r => print(s"${r.peek().litValue()} ")); println }
//      println

      c.clock.step()
      c.io.inData.valid.poke(false.B)

      for (i <- 1 until kSize) {
        for (j <- 0 until i) {
          c.io.outData.bits(i)(j).expect((j + 1).U)
        }
//        c.io.outData.bits.foreach { row => row.foreach(r => print(s"${r.peek().litValue()} ")); println }
//        println
        c.clock.step()
      }
    }
  }

  it should "slide over the input" in {
    test(new KernelShiftRegister(UInt(dWidth.W), kSize)) { c =>
      for (i <- 0 until repeats) {
        for (j <- 0 until kSize) {
          c.io.inData.bits(j).poke(((i * kSize) + j + 1).U)
        }

//        for (j <- 0 until kSize) {
//          for (k <- 0 until kSize) {
//            println(s"${(i * kSize + j * kSize + k + 1)} ${c.io.outData.bits(j)(k).peek().litValue()}")
//            c.io.outData.bits(j)(k).expect((i * kSize + j * kSize + k + 1).U)
//          }
//          for (j <- 0 until i) {
////            c.io.outData.bits(i)(j).expect((j + 1).U)
//            println(s"${c.io.outData.bits(i)(j).peek().litValue()}")
//          }
//          println
//          c.io.outData.bits(0).foreach(r => print(f"${r.peek().litValue()}%5s"))
//        }
        c.io.outData.bits.foreach { row => row.foreach(r => print(f"${r.peek().litValue()}%5s")); println }
        println
        c.clock.step()
      }
    }
  }
}
