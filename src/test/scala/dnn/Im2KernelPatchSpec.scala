package dnn

import chisel3._
import chisel3.tester.experimental.TestOptionBuilder._
import chiseltest._
import myutil.util.printArray
import treadle.{VerboseAnnotation, WriteVcdAnnotation}
import org.scalatest._

import scala.util.Random

class Im2KernelPatchSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("Im2KernelPatchSpec")

  val repeats = 20
  val dWidth = 32
  val kSize = 3
  val imgSize = 8
  val cols = 8
  val myRand = new Random
  val testImg = List.tabulate(imgSize, imgSize) { (i, j) =>
    (i * imgSize) + j + 1
  }
  printArray(testImg.toArray.map(_.toArray))

  it should "fill" in {
    test(new Im2KernelPatch(UInt(dWidth.W), cols, kSize)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
      for (r <- 0 until imgSize) {
        c.io.inData.valid.poke(true.B)
        for (cl <- 0 until imgSize) {
          c.io.inData.bits(cl).poke(testImg(r)(cl).U)
        }
        c.clock.step()
        c.io.inData.valid.poke(false.B)

        for (_ <- 0 until cols) {
          c.io.outData.foreach { row => row.foreach(r => print(s"${r.peek().litValue()} ")); println }
          c.clock.step()
          println
        }
        println("**************")
      }

//      for (_ <- 0 until imgSize * imgSize) {
//        c.io.outData.foreach { row => row.foreach(r => print(s"${r.peek().litValue()} ")); println }
//        c.clock.step()
//        println
//      }
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
