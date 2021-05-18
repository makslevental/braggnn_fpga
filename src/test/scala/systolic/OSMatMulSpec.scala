package systolic

import Util.{RandomVector, matMatMult}
import chisel3._
import chiseltest._
import org.scalatest._

class OSMatMulSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "OSMatMul"

  val repeats  = 5
  val bitWidth = 32

  it should "should compute square matrix matrix product" in {
    val N = 8
    test(new OSMatMul(N, N, bitWidth)) { c =>
      for (_ <- 0 until repeats) {
        val matGen = new RandomVector(N, bitWidth)
        val inA = Array.fill(N) {
          matGen.smallpos
        }
        val inB = Array.fill(N) {
          matGen.smallpos
        }
        val res = matMatMult(inA, inB)

        val padding = N - 1
        val delayedA = inA.zipWithIndex.map {
          case (row, index) =>
            Array.fill(index)(0) ++ row ++ Array.fill(padding - index)(0)
        }

        val delayedB = inB.transpose.zipWithIndex.map {
          case (row, index) =>
            Array.fill(index)(0) ++ row ++ Array.fill(padding - index)(0)
        }

        for (j <- 0 until 2 * N - 1) {
          for (i <- 0 until N) {
            c.io.A(i).poke(delayedA(i)(j).U)
            c.io.B(i).poke(delayedB(i)(j).U)
          }
          c.clock.step()
        }
        c.clock.step(padding)

        for (i <- 0 until N) {
          for (j <- 0 until N) {
            c.io.C(i)(j).expect(res(i)(j).U)
          }
        }
        c.reset.poke(true.B)
        c.clock.step()
        c.reset.poke(false.B)
      }
    }
  }

  it should "should compute (NXM)(MXR) -> (NXR) matrix matrix product" in {
    val N = 8
    val M = 8
    val R = 8
    test(new OSMatMul(N, R, bitWidth)) { c =>
      for (_ <- 0 until repeats) {
        val aGen = new RandomVector(M, bitWidth)
        val bGen = new RandomVector(R, bitWidth)
        val inA = Array.fill(N) {
          aGen.smallpos
        }
        val inB = Array.fill(M) {
          bGen.smallpos
        }
        val res = matMatMult(inA, inB)

        val padding = math.max(N, M) - 1

        val delayedA = inA.zipWithIndex.map {
          case (row, index) =>
            Array.fill(index)(0) ++ row ++ Array.fill(padding - index)(0)
        }

        val delayedB = inB.transpose.zipWithIndex.map {
          case (row, index) =>
            Array.fill(index)(0) ++ row ++ Array.fill(padding - index)(0)
        }

        for (j <- 0 until N + M - 1) {
          for (i <- 0 until N) {
            c.io.A(i).poke(delayedA(i)(j).U)
          }
          for (i <- 0 until R) {
            c.io.B(i).poke(delayedB(i)(j).U)
          }
          c.clock.step()
        }
        c.clock.step(padding)

        for (i <- 0 until N) {
          for (j <- 0 until R) {
            c.io.C(i)(j).expect(res(i)(j).U)
          }
        }
        c.reset.poke(true.B)
        c.clock.step()
        c.reset.poke(false.B)
      }
    }
  }

}
