package systolic

import Util.{RandomVector, matMatMult, printArray}
import chisel3._
import chiseltest._
import org.scalatest._

import scala.collection.mutable.ArrayBuffer
import scala.util.Random

class ConvSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "WSMatMul"

  val repeats  = 5
  val bitWidth = 32
  val r        = new Random

  it should "should compute convolution" in {
    val repeats = 5

    for (_ <- 0 until repeats) {
      val nFilters   = 3
      val imChannels = 3
      val imHeight   = 3
      val imWidth    = 3
      val kHeight    = 2
      val kWidth     = 2

      // C x H x W
      val img    = Array.fill(imChannels, imHeight, imWidth)(r.nextInt(10) + 1)
      val kernel = Array.fill(nFilters, kHeight, kWidth)(r.nextInt(10) + 1)

      val kMatrixRows = nFilters
      val kMatrixCols = kHeight * kWidth * imChannels

      val nKernelPositions = (imHeight - kHeight + 1) * (imWidth - kWidth + 1)

      val imMatrixRows = kHeight * kWidth * imChannels
      val imMatrixCols = nKernelPositions

      val outMatrixRows = kMatrixRows
      val outMatrixCols = imMatrixCols

      require(kMatrixCols == imMatrixRows)

      test(new WSMatMul(kMatrixRows, kMatrixCols, bitWidth)) { c =>
//        val res = matMatMult(inA, inB)
//
//        val padding = math.max(N, M) - 1
//        val delayedB = inB.zipWithIndex.map {
//          case (row, index) =>
//            Array.fill(index)(0) ++ row ++ Array.fill(padding - index)(0)
//        }
//
//        println()
//        for (i <- 0 until N) {
//          for (j <- 0 until M) {
//            c.io.A(i)(j).poke(inA(i)(j).U)
//          }
//        }
//
//        c.clock.step()
//
//        val out = new ArrayBuffer[Array[BigInt]]()
//        for (j <- 0 until R + padding) {
//          for (i <- 0 until M) {
//            c.io.B(i).poke(delayedB(i)(j).U)
//          }
//          c.clock.step()
//
//          out += (0 until N).map(i => c.io.out(i).peek().litValue()).toArray
//
//        }
//        for (j <- 0 until math.min(N, M) - 1) {
//          c.clock.step()
//          out += (0 until N).map(i => c.io.out(i).peek().litValue()).toArray
//        }
//
//        for ((row, i) <- out.toArray.transpose.zipWithIndex) {
//          val r = row.drop(M - 1 + i).take(R)
//          try {
//            require(r === res(i))
//          } catch {
//            case e: IllegalArgumentException =>
//              println(s"N: $N M: $M R: $R")
//              printArray(row, "row")
//              printArray(r, "r")
//              printArray(res(i), "res(i)")
//
//              printArray(inA, "inA")
//              printArray(inB, "inB")
//              printArray(res, "res")
//              printArray(delayedB, "delayedB")
//              printArray(out.toArray, "out")
//              printArray(out.toArray.transpose, "out transpose")
//              throw e
//          }
//        }
//
//        c.reset.poke(true.B)
//        c.clock.step()
//        c.reset.poke(false.B)
      }

    }
  }

}
