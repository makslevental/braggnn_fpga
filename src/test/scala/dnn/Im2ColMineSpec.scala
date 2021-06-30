package dnn

import chisel3._
import chisel3.tester.experimental.TestOptionBuilder._
import chiseltest._
import myutil.util.printArray
import org.scalatest._
import treadle.WriteVcdAnnotation

import scala.util.Random

class Im2ColMineSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("Im2KernelPatchSpec")

  val repeats = 20
  val dWidth = 32
  val kSize = 3
  val imgSize = 10
  val cols = imgSize
  val myRand = new Random
  val testImg = List.tabulate(imgSize, imgSize) { (i, j) =>
    (i * imgSize) + j + 1
  }
  printArray(testImg.toArray.map(_.toArray))

  it should "slide" in {
    test(new Im2ColMine(UInt(dWidth.W), cols, kSize)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
      for (r <- 0 until imgSize) {
        c.io.inData.valid.poke(true.B)
        for (cl <- 0 until imgSize) {
          c.io.inData.bits(cl).poke(testImg(r)(cl).U)
        }
        c.clock.step()
        c.io.inData.valid.poke(false.B)

        for (_ <- 0 until cols) {
          c.io.outData.foreach { r => print(f"${r.peek().litValue()}%5s") }
          println
          c.clock.step()
        }
        println(s"$r  **************")
      }
    }
  }

}
