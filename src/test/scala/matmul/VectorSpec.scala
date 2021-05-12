package matmul

import chisel3._
import chiseltest._
import org.scalatest._

import scala.collection.immutable.{Vector => _}

class VectorSpec extends FlatSpec with ChiselScalatestTester with Matchers {
    val elements = 7

    behavior of "Vector"

    it should "Not update its contents when write enable is false" in {
        test(new Vector(elements)) { c =>
            c.io.writeEnable.poke(false.B)

            c.io.dataIn.poke(123.U)
            for (ii <- 0 until c.elements) {
                c.io.idx.poke(ii.U)
                c.clock.step(1)
                c.io.dataOut.expect(0.U)
            }

            c.io.dataIn.poke(124.U)
            for (ii <- 0 until c.elements) {
                c.io.idx.poke(ii.U)
                c.clock.step(1)
                c.io.dataOut.expect(0.U)
            }
        }
    }

    it should "Update its registers when write enable is true" in {
        test(new Vector(elements)) { c =>
            c.io.writeEnable.poke(true.B)

            for (ii <- 0 until c.elements) {
                c.io.idx.poke(ii.U)
                c.io.dataIn.poke(ii.U)
                c.clock.step(1)
            }

            for (ii <- 0 until c.elements) {
                c.io.idx.poke(ii.U)
                c.io.dataOut.expect(ii.U)
                c.clock.step(1)
            }
        }

    }

    it should "Retain its data once write enable is set to false" in {
        test(new Vector(elements)) { c =>
            c.io.writeEnable.poke(true.B)

            for (ii <- 0 until c.elements) {
                c.io.idx.poke(ii.U)
                c.io.dataIn.poke(ii.U)
                c.clock.step(1)
            }

            c.io.writeEnable.poke(false.B)

            for (ii <- 0 until c.elements) {
                c.io.idx.poke(ii.U)
                c.io.dataOut.expect(ii.U)
                c.clock.step(1)
            }

            for (ii <- 0 until c.elements) {
                c.io.idx.poke(ii.U)
                c.io.dataOut.expect(ii.U)
                c.clock.step(1)
            }
        }
    }
}