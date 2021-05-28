package matmul

import chisel3.{assert, _}
import chiseltest._
import myutil.util.{matMatMult, matVecMult, RandomVector}
import org.scalatest._

//noinspection TypeAnnotation
class CMACSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("CMAC")

  val bitWidth = 8
  val cBits: Int = 16

  it should "multiply and accumulate things correctly" in {
    test(new CMAC(bitWidth, cBits)) { c =>
      val negativefp = (-3.5).F(4.BP)
      val positivefp = 3.5.F(4.BP)

      val c1 = new Complex(bitWidth)
      c1.real = negativefp
      c1.imag = positivefp
      val c2 = new Complex(bitWidth)
      c2.real = negativefp
      c2.imag = positivefp
      val c3 = new Complex(bitWidth)

      c.io.a.real.poke(negativefp)
      c.io.a.imag.poke(positivefp)
      c.io.b.real.poke(negativefp)
      c.io.b.imag.poke(positivefp)

//      c.io.a.poke(c1)
//      c.io.b.poke(c2)
//      c.io.c.poke(Complex(bitWidth.W))
//      c.clock.step(1)
//      c.io.y.expect(c3)

    }
  }
}

class ComplexMatrixMultSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("MatrixMult")

  val N = 16
  val M = 8
  val R = 4
  val repeats = 5
  val vecDim = 8
  val bitWidth = 32

  it should "should compute complex square matrix matrix product" in {
    test(new ComplexMatrixMatrixProduct(N, N, N, bitWidth)) { c =>
      for (_ <- 0 until repeats) {
        // generate data based on bits
        val AGen = new RandomVector(N, bitWidth)
        val BGen = new RandomVector(N, bitWidth)
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
            val c1 = new Complex(bitWidth)
            c1.real = inA(i)(j).F(bitWidth.W, 4.BP)
            c1.imag = 0.F(bitWidth.W, 0.BP)
            val c2 = new Complex(bitWidth)
            c2.real = inB(i)(j).F(bitWidth.W, 4.BP)
            c2.imag = 0.F(bitWidth.W, 0.BP)
            c.io.A.data(i)(j).real.poke(inA(i)(j).F(bitWidth.W, 4.BP))
            c.io.A.data(i)(j).imag.poke(0.F(bitWidth.W, 4.BP))
            c.io.B.data(i)(j).real.poke(inB(i)(j).F(bitWidth.W, 4.BP))
            c.io.B.data(i)(j).imag.poke(0.F(bitWidth.W, 4.BP))
          }
        }

        println()
        c.clock.step(1)
        c.clock.step(1)

        for (i <- 0 until N) {
          for (j <- 0 until N) {
//            val c3 = new Complex(res(i)(j).F(bitWidth.W, 4.BP), 0.F(bitWidth.W, 0.BP))
            val c3 = new Complex(bitWidth)
            c3.real = res(i)(j).F(bitWidth.W, 4.BP)
            c3.imag = 0.F(bitWidth.W, 0.BP)
            c.io.out.data(i)(j).real.expect(res(i)(j).F(bitWidth.W, 4.BP))
            c.io.out.data(i)(j).imag.expect(0.F(bitWidth.W, 4.BP))
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
        val vecGen = new RandomVector(R, bitWidth)
        val matGen = new RandomVector(R, bitWidth)
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
        val AGen = new RandomVector(M, bitWidth)
        val BGen = new RandomVector(R, bitWidth)
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
