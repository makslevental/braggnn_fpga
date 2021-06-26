package dnn

import chisel3._
import chiseltest._
import org.scalatest._

class KernelShiftRegisterSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("KernelShiftRegister")

  val repeats = 20
  val dWidth = 32
  val kSize = 5

  it should "should fill" in {
    test(new KernelShiftRegister(UInt(dWidth.W), kSize)) { c =>
      c.io.inData.valid.poke(true.B)
      for (i <- 0 until kSize) {
        c.io.inData.bits(i).poke(1.U)
      }
      c.io.outData.foreach { row => row.foreach(r => print(s"${r.peek().litValue()} ")); println }
      println
      c.clock.step()

      for (_ <- 0 until kSize) {
        c.io.outData.foreach { row => row.foreach(r => print(s"${r.peek().litValue()} ")); println }
        c.clock.step()
        println
      }
    }
  }

  it should "should rotate" in {
    test(new KernelShiftRegister(UInt(dWidth.W), kSize)) { c =>
      c.io.outData.foreach { row => row.foreach(r => print(s"${r.peek().litValue()} ")); println }
      println

      c.io.inData.valid.poke(true.B)
      for (i <- 0 until kSize) {
        c.io.inData.bits(i).poke(1.U)
      }

      c.clock.step()

      c.io.outData.foreach { row => row.foreach(r => print(f"${r.peek().litValue()}%5s")); println }
      println

      for (i <- 0 until repeats) {
        for (j <- 0 until kSize) {
          c.io.inData.bits(j).poke((i + 2).U)
        }
        c.clock.step()

        c.io.outData.foreach { row => row.foreach(r => print(f"${r.peek().litValue()}%5s")); println }
        println
      }
    }
  }
}
