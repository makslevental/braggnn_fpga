package dnn

import chisel3._
import chisel3.tester.experimental.TestOptionBuilder._
import chiseltest._
import myutil.util.{breezeConv, conv, printArray}
import org.scalatest._
import treadle.WriteVcdAnnotation

import scala.util.Random

class ConvSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("ConvSpec")

  val repeats = 20
  val dWidth = 32
  val kSize = 8
  val imgSize = 10
  val cols = imgSize
  val myRand = new Random
  val testImg = Array.tabulate(imgSize, imgSize) { (i, j) =>
    (i * imgSize) + j + 1
  }
  printArray(testImg)
  val kernel = Array.tabulate(kSize, kSize) { (i, j) =>
    (i * kSize) + j
  }
  printArray(kernel)
//  printArray(conv(Array(testImg), Array(Array(kernel))))

//  breezeConv(
//    testImg,
//    kernel
//  )

  it should "slide" in {
    test(new Conv(UInt(dWidth.W), cols, kernel)).withAnnotations(Seq(WriteVcdAnnotation)) { c =>
      for (r <- 0 until imgSize) {
        c.io.inData.valid.poke(true.B)
        for (cl <- 0 until imgSize) {
          c.io.inData.bits(cl).poke(testImg(r)(cl).U)
        }
        c.clock.step()
        c.io.inData.valid.poke(false.B)

        for (_ <- 0 until cols) {
          print(f"${c.io.outData.peek().litValue()}%8s")
          c.clock.step()
        }
        println
      }
    }
  }

}
