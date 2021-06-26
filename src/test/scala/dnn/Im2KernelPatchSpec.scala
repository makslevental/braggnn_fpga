package dnn

import chisel3._
import chiseltest._
import org.scalatest._

import scala.util.Random

class Im2KernelPatchSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("Im2KernelPatchSpec")

  val repeats = 20
  val dWidth = 32
  val kSize = 5
  val imgSize = 32
  val cols = 32
  val myRand = new Random
  val testImg = List.tabulate(imgSize, imgSize) { (i, j) =>
    (i * imgSize) + j
  }

  it should "should fill" in {
    test(new Im2KernelPatch(UInt(dWidth.W), cols, kSize)) { c =>
      for (r <- 0 until imgSize) {
        c.io.inData.valid.poke(true.B)
        for (cl <- 0 until imgSize) {
          c.io.inData.bits(cl).poke(testImg(r)(cl).U)
        }
        c.clock.step()
        c.io.inData.valid.poke(false.B)

        c.io.outData.foreach { row => row.foreach(r => print(s"${r.peek().litValue()} ")); println }
        println
      }

      for (_ <- 0 until imgSize * imgSize) {
        c.io.outData.foreach { row => row.foreach(r => print(s"${r.peek().litValue()} ")); println }
        c.clock.step()
        println
      }
    }
  }

//  it should "should rotate" in {
//    test(new KernelShiftRegister(UInt(dWidth.W), kSize)) { c =>
//      c.io.outData.foreach { row => row.foreach(r => print(s"${r.peek().litValue()} ")); println }
//      println
//
//      c.io.inData.valid.poke(true.B)
//      for (i <- 0 until kSize) {
//        c.io.inData.bits(i).poke(1.U)
//      }
//
//      c.clock.step()
//
//      c.io.outData.foreach { row => row.foreach(r => print(f"${r.peek().litValue()}%5s")); println }
//      println
//
//      for (i <- 0 until repeats) {
//        for (j <- 0 until kSize) {
//          c.io.inData.bits(j).poke((i + 2).U)
//        }
//        c.clock.step()
//
//        c.io.outData.foreach { row => row.foreach(r => print(f"${r.peek().litValue()}%5s")); println }
//        println
//      }
//    }
//  }
}
