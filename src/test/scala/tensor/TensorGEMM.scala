package tensor

import chisel3._
import chiseltest._
import org.scalatest._

import scala.math.pow


class MACSpec extends FlatSpec with ChiselScalatestTester with Matchers {
    behavior of "MAC"

    val aBits = 8
    val bBits: Int = 8
    val cBits: Int = 16

    it should "multiply and accumulate things correctly" in {
        test(new MAC(aBits, bBits, cBits)) { c =>
            c.io.a.poke(1.S(aBits.W))
            c.io.b.poke(1.S(bBits.W))
            c.io.c.poke(1.S(cBits.W))
            c.clock.step(1)
            c.io.y.expect(2.S(cBits.W))

            c.io.a.poke(2.S(aBits.W))
            c.io.b.poke(2.S(bBits.W))
            c.io.c.poke(2.S(cBits.W))
            c.clock.step(1)
            c.io.y.expect(6.S(cBits.W))

            c.io.a.poke(3.S(aBits.W))
            c.io.b.poke(3.S(bBits.W))
            c.io.c.poke(3.S(cBits.W))
            c.clock.step(1)
            c.io.y.expect(12.S(cBits.W))
        }
    }
}

class AdderSpec extends FlatSpec with ChiselScalatestTester with Matchers {
    behavior of "Adder"

    val aBits = 8
    val bBits: Int = 8


    it should "add things correctly without a cycle" in {
        test(new Adder(aBits, bBits)) { c =>
            c.io.a.poke(1.S(aBits.W))
            c.io.b.poke(1.S(bBits.W))
            c.io.y.expect(2.S(aBits.W))

            c.io.a.poke(2.S(aBits.W))
            c.io.b.poke(2.S(bBits.W))
            c.io.y.expect(4.S(aBits.W))

            c.io.a.poke(3.S(aBits.W))
            c.io.b.poke(3.S(bBits.W))
            c.io.y.expect(6.S(aBits.W))
        }
    }
}

class PipeAdderSpec extends FlatSpec with ChiselScalatestTester with Matchers {
    behavior of "Adder"

    val aBits = 8
    val bBits: Int = 8


    it should "add things correctly after a cycle" in {
        test(new PipeAdder(aBits, bBits)) { c =>
            c.io.a.poke(1.S(aBits.W))
            c.io.b.poke(1.S(bBits.W))
            c.clock.step(1)
            c.io.y.expect(2.S(aBits.W))

            c.io.a.poke(2.S(aBits.W))
            c.io.b.poke(2.S(bBits.W))
            c.clock.step(1)
            c.io.y.expect(4.S(aBits.W))

            c.io.a.poke(3.S(aBits.W))
            c.io.b.poke(3.S(bBits.W))
            c.clock.step(1)
            c.io.y.expect(6.S(aBits.W))
        }
    }
}

class DotProdSpec extends FlatSpec with ChiselScalatestTester with Matchers {
    behavior of "DotProd"

    val rand = new scala.util.Random(1)
    val elements = 8

    val aBits = 8
    val bBits: Int = 8

    def dotProduct(vec1: List[Int], vec2: List[Int]): Int = vec1.zip(vec2).map { case (a, b) => a * b }.sum

    it should "should compute dot product" in {
        test(new DotProduct(aBits, bBits, elements)) { c =>
            val vec1 = List.fill(elements)(rand.nextInt(20) + 1)
            val vec2 = List.fill(elements)(rand.nextInt(20) + 1)
            val dotProd = dotProduct(vec1, vec2)

            vec1.zip(vec2).zipWithIndex.foreach { case ((a, b), i) =>
                c.io.a(i).poke(a.S)
                c.io.b(i).poke(b.S)
            }
            // TODO: why two cycles?
            c.clock.step(1)
            c.clock.step(1)
            c.io.y.expect(dotProd.S)
        }
    }
}

class MatrixMultSpec extends FlatSpec with ChiselScalatestTester with Matchers {
    behavior of "MatrixMult"

    val N = 16
    val M = 8
    val R = 4
    val repeats = 5
    val vecDim = 8
    val bitWidth = 32

    def matMatMult(A: Array[Array[Int]], B: Array[Array[Int]]): Array[Array[Int]] = {
        B.transpose.map(b => matVecMult(A, b, 0)).transpose
    }

    def matVecMult(mat: Array[Array[Int]], vec: Array[Int], shift: Int): Array[Int] = {
        val res = Array.fill(mat.length) {
            0
        }
        for (i <- mat.indices) {
            var dot = 0
            for (j <- mat(i).indices) {
                dot += mat(i)(j) * vec(j)
            }
            res(i) = dot * pow(2, shift).toInt
        }
        res
    }

    it should "should compute square matrix vector product" in {
        test(new MatrixVectorProduct(vecDim, vecDim, bitWidth)) { c =>
            for (_ <- 0 until repeats) {
                // generate data based on bits
                val vecGen = new RandomArray(vecDim, bitWidth)
                val matGen = new RandomArray(vecDim, bitWidth)
                val inVec = vecGen.smallpos
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
                val inVec = vecGen.smallpos
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