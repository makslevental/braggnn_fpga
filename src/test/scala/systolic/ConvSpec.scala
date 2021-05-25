package systolic

import myutil.util.{conv, im2col, printArray}
import chisel3._
import chiseltest._
import org.scalatest._

import scala.collection.mutable.ArrayBuffer
import scala.util.Random

//noinspection TypeAnnotation
class ConvSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("WSMatMul")

  val repeats = 5
  val bitWidth = 32
  val r = new Random

  it should "should compute convolution" in {
    for (_ <- 0 until repeats) {
      val kHeight = r.nextInt(6) + 1
      val kWidth = kHeight
      val imChannels = r.nextInt(6) + 1
      val imHeight = r.nextInt(6) + kHeight
      val imWidth = r.nextInt(6) + kHeight
      val nFilters = r.nextInt(6) + 1

      // C x H x W
      val img = Array.fill(imChannels, imHeight, imWidth)(r.nextInt(10) + 1)
      val kernel = Array.fill(nFilters, imChannels, kHeight, kWidth)(r.nextInt(10) + 1)

      val kMatrixRows = nFilters
      val kMatrixCols = kHeight * kWidth * imChannels

      val nKernelPositions = (imHeight - kHeight + 1) * (imWidth - kWidth + 1)

      val imMatrixRows = kHeight * kWidth * imChannels
      val imMatrixCols = nKernelPositions

      val outMatrixRows = kMatrixRows
      val outMatrixCols = imMatrixCols

      require(kMatrixCols == imMatrixRows)

      test(new WSMatMul(kMatrixRows, kMatrixCols, bitWidth)) { c =>
        val res = conv(img, kernel)
        val (imMatrix, kMatrix) = im2col(img, kernel)
        require(imMatrix.length == imMatrixRows && imMatrix.head.length == imMatrixCols)
        require(kMatrix.length == kMatrixRows && kMatrix.head.length == kMatrixCols)

        val padding = math.max(kMatrixRows, kMatrixCols) - 1
        val delayedB = imMatrix.zipWithIndex.map { case (row, index) =>
          Array.fill(index)(0) ++ row ++ Array.fill(padding - index)(0)
        }

        for (i <- 0 until kMatrixRows) {
          for (j <- 0 until kMatrixCols) {
            c.io.A(i)(j).poke(kMatrix(i)(j).U)
          }
        }

        c.clock.step()

        val out = new ArrayBuffer[Array[BigInt]]()
        for (j <- 0 until imMatrixCols + padding) {
          for (i <- 0 until kMatrixCols) {
            c.io.B(i).poke(delayedB(i)(j).U)
          }
          c.clock.step()

          out += (0 until kMatrixRows).map(i => c.io.out(i).peek().litValue()).toArray

        }
        for (j <- 0 until math.min(kMatrixRows, kMatrixCols) - 1) {
          c.clock.step()
          out += (0 until kMatrixRows).map(i => c.io.out(i).peek().litValue()).toArray
        }

//        printArray(res, "res")
//        printArray(out.toArray.transpose, "out transpose")

        for ((row, i) <- out.toArray.transpose.zipWithIndex) {
          val r = row.drop(kMatrixCols - 1 + i).take(imMatrixCols)
          try {
            require(r === res(i).flatten)
          } catch {
            case e: IllegalArgumentException =>
              println(s"N: $kMatrixRows M: $kMatrixCols R: $imMatrixCols")
              printArray(row, "row")
              printArray(r, "r")
              printArray(res(i), "res(i)")

              printArray(kMatrix, "kMatrix")
              printArray(imMatrix, "imMatrix")
              printArray(res, "res")
              printArray(delayedB, "delayedB")
              printArray(out.toArray, "out")
              printArray(out.toArray.transpose, "out transpose")
              throw e
          }
        }

        c.reset.poke(true.B)
        c.clock.step()
        c.reset.poke(false.B)
      }

    }
  }

}
