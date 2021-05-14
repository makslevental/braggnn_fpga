package matmul

import chisel3._
import chiseltest._
import org.scalatest._

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

