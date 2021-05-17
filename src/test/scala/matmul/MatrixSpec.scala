package matmul

import Util.{RandomArray, matMatMult, matVecMult}
import chisel3._
import chiseltest._
import org.scalatest._

class DotProdSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "DotProd"

  val rand     = new scala.util.Random(1)
  val elements = 8
  val bitWidth = 8
  val repeats  = 5
  def dotProduct(vec1: List[Int], vec2: List[Int]): Int =
    vec1.zip(vec2).map { case (a, b) => a * b }.sum

  it should "should compute dot product" in {
    test(new DotProduct(bitWidth, elements)) { c =>
      for (_ <- 0 until repeats) {
        val vec1    = List.fill(elements)(rand.nextInt(50) + 1)
        val vec2    = List.fill(elements)(rand.nextInt(50) + 1)
        val dotProd = dotProduct(vec1, vec2)

        vec1.zip(vec2).zipWithIndex.foreach {
          case ((a, b), i) =>
            c.io.a(i).poke(a.S)
            c.io.b(i).poke(b.S)
        }
        c.clock.step(1)
        c.clock.step(1)

        for (i <- 0 until elements) {
          println(c.io.y.peek())
        }

        c.io.y.expect(dotProd.S)
      }
    }
  }
}

class MatrixMultSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "MatrixMult"

  val N        = 16
  val M        = 8
  val R        = 4
  val repeats  = 5
  val vecDim   = 8
  val bitWidth = 32

  it should "should compute square matrix vector product" in {
    test(new MatrixVectorProduct(vecDim, vecDim, bitWidth)) { c =>
      for (_ <- 0 until repeats) {
        // generate data based on bits
        val vecGen = new RandomArray(vecDim, bitWidth)
        val matGen = new RandomArray(vecDim, bitWidth)
        val inVec  = vecGen.smallpos
        val inMat = Array.fill(vecDim) {
          matGen.smallpos
        }
        val res = matVecMult(inMat, inVec, 0)

        for (i <- 0 until vecDim) {
          c.io.vec(i).poke(inVec(i).S)
          for (j <- 0 until vecDim) {
            c.io.mat.data(i)(j).poke(inMat(i)(j).S)
          }
        }

        c.clock.step(1)
        c.clock.step(1)

        for (i <- 0 until vecDim) {
          c.io.out(i).expect(res(i).asSInt())
        }
      }
    }
  }

  it should "should compute square matrix matrix product" in {
    test(new MatrixMatrixProduct(N, N, N, bitWidth)) { c =>
      for (_ <- 0 until repeats) {
        // generate data based on bits
        val AGen = new RandomArray(N, bitWidth)
        val BGen = new RandomArray(N, bitWidth)
        val inA = Array.fill(N) {
          AGen.smallpos
        }
        val inB = Array.fill(N) {
          BGen.smallpos
        }
        val res = matMatMult(inA, inB)

//                println(s"A: ${inA.deep}".replace("Array(", "\n[").replace(")", "]"))
//                println(s"B: ${inB.deep}".replace("Array(", "\n[").replace(")", "]"))
//                println(s"C: ${res.deep}".replace("Array(", "\n[").replace(")", "]"))

        for (i <- 0 until N) {
          for (j <- 0 until N) {
            c.io.A.data(i)(j).poke(inA(i)(j).S)
            c.io.B.data(i)(j).poke(inB(i)(j).S)
          }
        }

        println()
        c.clock.step(1)
        c.clock.step(1)

        for (i <- 0 until N) {
          for (j <- 0 until N) {
            c.io.out.data(i)(j).expect(res(i)(j).S)
            //                        print(s"${c.io.out.data(i)(j).peek().litValue()}, ")
          }
          println()
        }
      }
    }
  }

  it should "should compute non-square matrix vector product" in {
    test(new MatrixVectorProduct(M, R, bitWidth)) { c =>
      for (_ <- 0 until repeats) {
        // generate data based on bits
        val vecGen = new RandomArray(R, bitWidth)
        val matGen = new RandomArray(R, bitWidth)
        val inVec  = vecGen.smallpos
        val inMat = Array.fill(M) {
          matGen.smallpos
        }
        val res = matVecMult(inMat, inVec, 0)

//                println(s"Mat: ${inMat.deep}".replace("Array(", "\n[").replace(")", "]"))
//                println(s"Vec: ${inVec.deep}".replace("Array(", "\n[").replace(")", "]"))
//                println(s"res: ${res.deep}".replace("Array(", "\n[").replace(")", "]"))

        for (i <- 0 until M) {
          for (j <- 0 until R) {
            c.io.mat.data(i)(j).poke(inMat(i)(j).S)
          }
        }

        for (i <- 0 until R) {
          c.io.vec(i).poke(inVec(i).S)
        }

        c.clock.step(1)
        c.clock.step(1)

        for (i <- 0 until R) {
          c.io.out(i).expect(res(i).asSInt())
        }
      }
    }
  }

  it should "should compute non-square matrix matrix product" in {
    test(new MatrixMatrixProduct(N, M, R, bitWidth)) { c =>
      for (_ <- 0 until repeats) {
        // generate data based on bits
        val AGen = new RandomArray(M, bitWidth)
        val BGen = new RandomArray(R, bitWidth)
        val inA = Array.fill(N) {
          AGen.smallpos
        }
        val inB = Array.fill(M) {
          BGen.smallpos
        }
        val res = matMatMult(inA, inB)

//                println(s"A: ${inA.deep}".replace("Array(", "\n[").replace(")", "]"))
//                println(s"B: ${inB.deep}".replace("Array(", "\n[").replace(")", "]"))
//                println(s"C: ${res.deep}".replace("Array(", "\n[").replace(")", "]"))

        for (i <- 0 until N) {
          for (j <- 0 until M) {
            c.io.A.data(i)(j).poke(inA(i)(j).S)
          }
        }

        for (i <- 0 until M) {
          for (j <- 0 until R) {
            c.io.B.data(i)(j).poke(inB(i)(j).S)
          }
        }

        println()
        c.clock.step(1)
        c.clock.step(1)

        for (i <- 0 until N) {
          for (j <- 0 until R) {
            c.io.out.data(i)(j).expect(res(i)(j).S)
            //                        print(s"${c.io.out.data(i)(j).peek().litValue()}, ")
          }
          //                    println()
        }
      }
    }
  }
}

class FrobeniusInnerProductSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "FrobeniusInnerProduct"

  val rand     = new scala.util.Random(1)
  val elements = 4
  val bitWidth = 8
  val repeats  = 5

  def frobProduct(mat1: List[List[Int]], mat2: List[List[Int]]): Int =
    mat1.zip(mat2).map { case (a, b) => dotProduct(a, b) }.sum

  def dotProduct(vec1: List[Int], vec2: List[Int]): Int =
    vec1.zip(vec2).map { case (a, b) => a * b }.sum

  it should "should compute frob product" in {
    test(new FrobeniusInnerProduct(elements, elements, bitWidth)) { c =>
      for (_ <- 0 until repeats) {
        val mat1 =
          List.fill(elements)(List.fill(elements)(rand.nextInt(20) + 1))
        val mat2 =
          List.fill(elements)(List.fill(elements)(rand.nextInt(20) + 1))
        val frobProd = frobProduct(mat1, mat2)

        mat1.zip(mat2).zipWithIndex.foreach {
          case ((vec1, vec2), i) =>
            vec1.zip(vec2).zipWithIndex.foreach {
              case ((a, b), j) =>
                c.io.A.data(i)(j).poke(a.S)
                c.io.B.data(i)(j).poke(b.S)
            }
        }
        c.clock.step(1)
        c.clock.step(1)
        c.clock.step(1)
        c.clock.step(1)
        c.io.y.expect(frobProd.S)
      }
    }
  }
}
