package matmul

import chisel3._
import chiseltest._
import org.scalatest._

class MACSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "MAC"

  val bitWidth   = 8
  val cBits: Int = 16

  it should "multiply and accumulate things correctly" in {
    test(new MAC(bitWidth, cBits)) { c =>
      c.io.a.poke(1.S(bitWidth.W))
      c.io.b.poke(1.S(bitWidth.W))
      c.io.c.poke(1.S(cBits.W))
      c.clock.step(1)
      c.io.y.expect(2.S(cBits.W))

      c.io.a.poke(2.S(bitWidth.W))
      c.io.b.poke(2.S(bitWidth.W))
      c.io.c.poke(2.S(cBits.W))
      c.clock.step(1)
      c.io.y.expect(6.S(cBits.W))

      c.io.a.poke(3.S(bitWidth.W))
      c.io.b.poke(3.S(bitWidth.W))
      c.io.c.poke(3.S(cBits.W))
      c.clock.step(1)
      c.io.y.expect(12.S(cBits.W))
    }
  }
}

class AdderSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "Adder"

  val bitWidth = 8

  it should "add things correctly without a cycle" in {
    test(new Adder(bitWidth)) { c =>
      c.io.a.poke(1.S(bitWidth.W))
      c.io.b.poke(1.S(bitWidth.W))
      c.io.y.expect(2.S(bitWidth.W))

      c.io.a.poke(2.S(bitWidth.W))
      c.io.b.poke(2.S(bitWidth.W))
      c.io.y.expect(4.S(bitWidth.W))

      c.io.a.poke(3.S(bitWidth.W))
      c.io.b.poke(3.S(bitWidth.W))
      c.io.y.expect(6.S(bitWidth.W))
    }
  }
}

class PipeAdderSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "Adder"

  val bitWidth = 8

  it should "add things correctly after a cycle" in {
    test(new PipeAdder(bitWidth)) { c =>
      c.io.a.poke(1.S(bitWidth.W))
      c.io.b.poke(1.S(bitWidth.W))
      c.clock.step(1)
      c.io.y.expect(2.S(bitWidth.W))

      c.io.a.poke(2.S(bitWidth.W))
      c.io.b.poke(2.S(bitWidth.W))
      c.clock.step(1)
      c.io.y.expect(4.S(bitWidth.W))

      c.io.a.poke(3.S(bitWidth.W))
      c.io.b.poke(3.S(bitWidth.W))
      c.clock.step(1)
      c.io.y.expect(6.S(bitWidth.W))
    }
  }
}

class LogSumSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "LogSum"

  val bitWidth = 8
  val elements = 8

  val rand    = new scala.util.Random(1)
  val repeats = 5

  it should "should sum all elements correctly" in {
    test(new LogSum(bitWidth, elements)) { c =>
      for (_ <- 0 until repeats) {
        val vec1 = List.fill(elements)(rand.nextInt(20) + 1)
        for (i <- vec1.indices) {
          c.io.inVec(i).poke(vec1(i).S)
        }

        c.clock.step(1)
        c.clock.step(1)
        c.io.y.expect(vec1.sum.S)
      }
    }
  }
}
