package matmul

import breeze.linalg.DenseMatrix
import chisel3.{assert, _}
import chiseltest._
import myutil.util.{matMatMult, matVecMult, readCsvMatrices, RandomVector}
import org.scalatest._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.VerilatorBackendAnnotation

//noinspection TypeAnnotation
class CMACSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior.of("CMAC")

  val bitWidth = 8
  val cBits: Int = 16

  it should "multiply and accumulate things correctly" in {
    test(new CMAC(bitWidth, cBits)).withAnnotations(Seq(VerilatorBackendAnnotation)) { c =>
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
  val repeats = 1
  val vecDim = 8
  val bitWidth = 32

//  it should "should compute complex square matrix matrix product" in {
//    test(new ComplexMatrixMatrixProduct(N, N, N, bitWidth)).withAnnotations(Seq(VerilatorBackendAnnotation)) { c =>
//      for (_ <- 0 until repeats) {
//        // generate data based on bits
//        val AGen = new RandomVector(N, bitWidth)
//        val BGen = new RandomVector(N, bitWidth)
//        val inA = Array.fill(N) {
//          AGen.smallpos
//        }
//        val inB = Array.fill(N) {
//          BGen.smallpos
//        }
//        val res = matMatMult(inA, inB)
//
//        for (i <- 0 until N) {
//          for (j <- 0 until N) {
//            val c1 = new Complex(bitWidth)
//            c1.real = inA(i)(j).F(bitWidth.W, 4.BP)
//            c1.imag = 0.F(bitWidth.W, 0.BP)
//            val c2 = new Complex(bitWidth)
//            c2.real = inB(i)(j).F(bitWidth.W, 4.BP)
//            c2.imag = 0.F(bitWidth.W, 0.BP)
//            c.io.A.data(i)(j).real.poke(inA(i)(j).F(bitWidth.W, 4.BP))
//            c.io.A.data(i)(j).imag.poke(0.F(bitWidth.W, 4.BP))
//            c.io.B.data(i)(j).real.poke(inB(i)(j).F(bitWidth.W, 4.BP))
//            c.io.B.data(i)(j).imag.poke(0.F(bitWidth.W, 4.BP))
//          }
//        }
//
//        println()
//        c.clock.step(1)
//        c.clock.step(1)
//
//        for (i <- 0 until N) {
//          for (j <- 0 until N) {
////            val c3 = new Complex(res(i)(j).F(bitWidth.W, 4.BP), 0.F(bitWidth.W, 0.BP))
//            val c3 = new Complex(bitWidth)
//            c3.real = res(i)(j).F(bitWidth.W, 4.BP)
//            c3.imag = 0.F(bitWidth.W, 0.BP)
//            c.io.out.data(i)(j).real.expect(res(i)(j).F(bitWidth.W, 4.BP))
//            c.io.out.data(i)(j).imag.expect(0.F(bitWidth.W, 4.BP))
//            //                        print(s"${c.io.out.data(i)(j).peek().litValue()}, ")
//          }
//          println()
//        }
//      }
//    }
//  }

  it should "should compute qubit matrices" in {
    val fps = "/Users/maksim/dev_projects/CMSC32900/scratch/matrix_csvs"
    val matrices = readCsvMatrices(fps)

    for ((contr, contr_matrices) <- matrices) {

      var result_real_matrices = scala.collection.mutable.ListBuffer.empty[DenseMatrix[Double]]
      var result_imag_matrices = scala.collection.mutable.ListBuffer.empty[DenseMatrix[Double]]
      for ((i, matrix) <- contr_matrices) {
        result_real_matrices += matrix.get("real").get
        result_imag_matrices += matrix.get("imag").get
      }
      var remaining = result_real_matrices.length
      while (remaining > 1) {
        println(s"************* $contr remaining $remaining")
        for (pair <- result_real_matrices.zip(result_imag_matrices).grouped(2)) {
          val (areal, aimag) = pair.head
          val (breal, bimag) = pair.last
          val N = areal.rows

          test(new ComplexMatrixMatrixProduct(N, N, N, bitWidth)) { c =>
            for (i <- 0 until N) {
              for (j <- 0 until N) {
                c.io.A.data(i)(j).real.poke(areal(i, j).F(bitWidth.W, 4.BP))
                c.io.A.data(i)(j).imag.poke(aimag(i, j).F(bitWidth.W, 4.BP))
                c.io.B.data(i)(j).real.poke(breal(i, j).F(bitWidth.W, 4.BP))
                c.io.B.data(i)(j).imag.poke(bimag(i, j).F(bitWidth.W, 4.BP))
              }
            }

            println()
            c.clock.step(1)
            c.clock.step(1)

            val res_real = DenseMatrix.zeros[Double](N, N)
            val res_imag = DenseMatrix.zeros[Double](N, N)

            for (i <- 0 until N) {
              for (j <- 0 until N) {
                res_real(i, j) = c.io.out.data(i)(j).peek().real.litToDouble
                res_imag(i, j) = c.io.out.data(i)(j).peek().imag.litToDouble
              }
            }
            result_real_matrices += res_real
            result_imag_matrices += res_imag
          }
        }
        result_real_matrices = result_real_matrices.drop(remaining)
        result_imag_matrices = result_imag_matrices.drop(remaining)

        remaining = result_real_matrices.length
      }
    }

  }

}

//class ComplexSIntMatrixMultSpec extends FlatSpec with ChiselScalatestTester with Matchers {
//  behavior.of("MatrixMult")
//
//  val N = 16
//  val M = 8
//  val R = 4
//  val repeats = 5
//  val vecDim = 8
//  val bitWidth = 32
//
//  it should "should compute complex square matrix matrix product" in {
//    test(new ComplexSIntMatrixMatrixProduct(N, N, N, bitWidth)) { c =>
//      for (_ <- 0 until repeats) {
//        // generate data based on bits
//        val AGen = new RandomVector(N, bitWidth)
//        val BGen = new RandomVector(N, bitWidth)
//        val inA = Array.fill(N) {
//          AGen.smallpos
//        }
//        val inB = Array.fill(N) {
//          BGen.smallpos
//        }
//        val res = matMatMult(inA, inB)
//
//        for (i <- 0 until N) {
//          for (j <- 0 until N) {
//            val c1 = new ComplexSInt(bitWidth)
//            c1.real = inA(i)(j).asSInt()
//            c1.imag = 0.S
//            val c2 = new ComplexSInt(bitWidth)
//            c2.real = inB(i)(j).asSInt()
//            c2.imag = 0.S
//            c.io.A.data(i)(j).real.poke(inA(i)(j).asSInt())
//            c.io.A.data(i)(j).imag.poke(0.S)
//            c.io.B.data(i)(j).real.poke(inB(i)(j).asSInt())
//            c.io.B.data(i)(j).imag.poke(0.S)
//          }
//        }
//
//        println()
//        c.clock.step(1)
//        c.clock.step(1)
//
//        for (i <- 0 until N) {
//          for (j <- 0 until N) {
//            val c3 = new ComplexSInt(bitWidth)
//            c3.real = res(i)(j).asSInt()
//            c3.imag = 0.S
//            c.io.out.data(i)(j).real.expect(res(i)(j).asSInt())
//            c.io.out.data(i)(j).imag.expect(0.S)
//          }
//        }
//      }
//    }
//  }
//}
