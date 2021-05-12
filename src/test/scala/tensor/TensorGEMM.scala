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

class MatrixVectorProdSpec extends FlatSpec with ChiselScalatestTester with Matchers {
    behavior of "MatrixVectorMultiplication"

    val vecDim = 8
    val bitWidth = 8

    def mvmRef(inp: Array[Int], wgt: Array[Array[Int]], shift: Int): Array[Int] = {
        val size = inp.length
        val res = Array.fill(size) {
            0
        }
        for (i <- 0 until size) {
            var dot = 0
            for (j <- 0 until size) {
                dot += wgt(i)(j) * inp(j)
            }
            res(i) = dot * pow(2, shift).toInt
        }
        res
    }

    it should "should compute matrix product" in {
        test(new MatrixVectorMultiplication(vecDim, bitWidth)) { c =>
            val cycles = 5
            for (i <- 0 until cycles) {
                // generate data based on bits
                val inpGen = new RandomArray(vecDim, bitWidth)
                val wgtGen = new RandomArray(vecDim, bitWidth)
                val in_a = inpGen.positive
                val in_b = Array.fill(vecDim) {
                    wgtGen.positive
                }
                println("[" + in_a.mkString(",") + "]")
                println("[")
                in_b.foreach( arr =>
                    println("[" + arr.mkString(",") + "],")
                )
                println("]")
                val res = mvmRef(in_a, in_b, 0)
                println("[" + res.mkString(",") + "]")
                println()
                val inpMask = helper.getMask(bitWidth)
                val wgtMask = helper.getMask(bitWidth)
                val accMask = helper.getMask(bitWidth)

                for (i <- 0 until vecDim) {
                    c.io.inp.data(i).poke((in_a(i) & inpMask).U)
                    c.io.acc_i.data(i).poke(0.U)
                    for (j <- 0 until vecDim) {
                        c.io.wgt.data.data(i)(j).poke((in_b(i)(j) & wgtMask).U)
                    }
                }

                c.io.reset.poke(false.B)

                c.io.inp.valid.poke(true.B)
                c.io.wgt.data.valid.poke(true.B)
                c.io.acc_i.valid.poke(true.B)

                c.clock.step(1)

                c.io.inp.valid.poke(false.B)
                c.io.wgt.data.valid.poke(false.B)
                c.io.acc_i.valid.poke(false.B)

                // wait for valid signal
                var i = 0;
                while (c.io.acc_o.valid.peek() === false) {
                    i += 1
                    println(i)
                    c.clock.step(1) // advance clock
                }
                if (c.io.acc_o.valid.peek() === true) {
                    for (i <- 0 until vecDim) {
                        c.io.acc_o.data(i).expect((res(i) & accMask).asUInt())
                    }
                }
            }
        }
    }


    //    it should "should compute matrix product" in {
    //        test(new MatrixVectorMultiplication()) { c =>
    //            val cycles = 5
    //            for (i <- 0 until cycles) {
    //                // generate data based on bits
    //                val inpGen = new RandomArray(c.size, c.inpBits)
    //                val wgtGen = new RandomArray(c.size, c.wgtBits)
    //                val in_a = inpGen.any
    //                val in_b = Array.fill(c.size) {
    //                    wgtGen.any
    //                }
    //                val res = mvmRef(in_a, in_b, 0)
    //                println("[" + res.mkString(",") + "]")
    //                val inpMask = helper.getMask(c.inpBits)
    //                val wgtMask = helper.getMask(c.wgtBits)
    //                val accMask = helper.getMask(c.accBits)
    //
    //                for (i <- 0 until c.size) {
    //                    c.io.inp.data.bits(0)(i).poke((in_a(i) & inpMask).U)
    //                    c.io.acc_i.data.bits(0)(i).poke(0.U)
    //                    for (j <- 0 until c.size) {
    //                        c.io.wgt.data.bits(i)(j).poke((in_b(i)(j) & wgtMask).U)
    //                    }
    //                }
    //
    //                c.io.reset.poke(false.B)
    //
    //                c.io.inp.data.valid.poke(true.B)
    //                c.io.wgt.data.valid.poke(true.B)
    //                c.io.acc_i.data.valid.poke(true.B)
    //
    //                c.clock.step(1)
    //
    //                c.io.inp.data.valid.poke(false.B)
    //                c.io.wgt.data.valid.poke(false.B)
    //                c.io.acc_i.data.valid.poke(false.B)
    //
    //                // wait for valid signal
    //                var i = 0;
    //                while (c.io.acc_o.data.valid.peek() === false) {
    //                    i += 1
    //                    println(i)
    //                    c.clock.step(1) // advance clock
    //                }
    //                if (c.io.acc_o.data.valid.peek() === true) {
    //                    for (i <- 0 until c.size) {
    //                        c.io.acc_o.data.bits(0)(i).expect((res(i) & accMask).asUInt())
    //                    }
    //                }
    //            }
    //        }
    //    }
}