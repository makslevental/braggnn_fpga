package systolic

import myutil.util.{matMatMult, printArray, RandomVector}
import chisel3._
import chiseltest._
import org.scalatest._

import scala.collection.mutable.ArrayBuffer
import scala.util.Random

//noinspection TypeAnnotation
class WSSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("WSMatMul")

  val repeats = 5
  val bitWidth = 32

  it should "should compute WS product" in {
    test(new WSProcElem(bitWidth)) { c =>
      for (_ <- 0 until repeats) {
        // 1 + 2*3 = 7
        c.io.inPartialSum.poke(1.U)
        c.io.inW.poke(2.U)
        c.io.inV.poke(3.U)

        c.clock.step()

        c.io.outV.expect(3.U)
        c.io.outPartialSum.expect(7.U)

        c.reset.poke(true.B)
        c.clock.step()
        c.reset.poke(false.B)

        // 2 + 3*4 = 14
        c.io.inPartialSum.poke(2.U)
        c.io.inW.poke(3.U)
        c.io.inV.poke(4.U)

        c.clock.step()

        c.io.outPartialSum.expect(14.U)
        c.io.outV.expect(4.U)
      }
    }
  }

  it should "should compute square matrix matrix product" in {
    val repeats = 5
    val r = new Random

    for (_ <- 0 until repeats) {
      val N = r.nextInt(10) + 1
      test(new WSMatMul(N, N, bitWidth)) { c =>
        val matGen = new RandomVector(N, bitWidth)
        val inA = Array.fill(N) {
          matGen.smallpos
        }
        val inB = Array.fill(N) {
          matGen.smallpos
        }
        val res = matMatMult(inA, inB)

        val padding = N - 1
        val delayedB = inB.zipWithIndex.map { case (row, index) =>
          Array.fill(index)(0) ++ row ++ Array.fill(padding - index)(0)
        }
        for (i <- 0 until N) {
          for (j <- 0 until N) {
            c.io.A(i)(j).poke(inA(i)(j).U)
          }
        }

        c.clock.step()

        require(2 * N - 1 == delayedB.head.length)

        var out = new ArrayBuffer[Array[BigInt]]()

        for (j <- 0 until 2 * N - 1) {
          for (i <- 0 until N) {
            c.io.B(i).poke(delayedB(i)(j).U)
          }
          c.clock.step()

          out += (0 until N).map(i => c.io.out(i).peek().litValue()).toArray
        }
        for (j <- 0 until padding) {
          c.clock.step()
          out += (0 until N).map(i => c.io.out(i).peek().litValue()).toArray
        }

        for ((row, i) <- out.toArray.transpose.zipWithIndex) {
          val r = row.drop(padding + i).take(N)
          require(r === res(i))
        }

        c.reset.poke(true.B)
        c.clock.step()
        c.reset.poke(false.B)
      }
    }
  }
  it should "should compute non-square matrix matrix product" in {
    val repeats = 5
    val r = new Random

    for (_ <- 0 until repeats) {
      val N = r.nextInt(10) + 1
      val M = r.nextInt(10) + 1
      val R = r.nextInt(10) + 1
      test(new WSMatMul(N, M, bitWidth)) { c =>
        val AGen = new RandomVector(M, bitWidth)
        val inA = Array.fill(N) {
          AGen.smallpos
        }
        val BGen = new RandomVector(R, bitWidth)
        val inB = Array.fill(M) {
          BGen.smallpos
        }
        val res = matMatMult(inA, inB)

        val padding = math.max(N, M) - 1
        val delayedB = inB.zipWithIndex.map { case (row, index) =>
          Array.fill(index)(0) ++ row ++ Array.fill(padding - index)(0)
        }

        println()
        for (i <- 0 until N) {
          for (j <- 0 until M) {
            c.io.A(i)(j).poke(inA(i)(j).U)
          }
        }

        c.clock.step()

        val out = new ArrayBuffer[Array[BigInt]]()
        for (j <- 0 until R + padding) {
          for (i <- 0 until M) {
            c.io.B(i).poke(delayedB(i)(j).U)
          }
          c.clock.step()

          out += (0 until N).map(i => c.io.out(i).peek().litValue()).toArray

        }
        for (j <- 0 until math.min(N, M) - 1) {
          c.clock.step()
          out += (0 until N).map(i => c.io.out(i).peek().litValue()).toArray
        }

        for ((row, i) <- out.toArray.transpose.zipWithIndex) {
          val r = row.drop(M - 1 + i).take(R)
          try {
            require(r === res(i))
          } catch {
            case e: IllegalArgumentException =>
              println(s"N: $N M: $M R: $R")
              printArray(row, "row")
              printArray(r, "r")
              printArray(res(i), "res(i)")

              printArray(inA, "inA")
              printArray(inB, "inB")
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
