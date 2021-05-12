package matmul

import chisel3._
import chiseltest._
import org.scalatest._

class DotProdSpec extends FlatSpec with ChiselScalatestTester with Matchers {
    behavior of "DotProd"

    val rand = new scala.util.Random(1)
    val elements = 8

    def dotProduct(vec1: List[Int], vec2: List[Int]): Int = vec1.zip(vec2).map { case (a, b) => a * b }.sum

    it should "signal the end and have the right value after" in {
        test(new DotProd(elements)) { c =>
            val vec1 = List.fill(elements)(rand.nextInt(20) + 1)
            val vec2 = List.fill(elements)(rand.nextInt(20) + 1)
            val dotProd = dotProduct(vec1, vec2)
            vec1.zip(vec2).foreach { case (a, b) =>
                c.io.dataInA.poke(a.U)
                c.io.dataInB.poke(b.U)
                c.clock.step(1)
            }
            c.io.outputValid.expect(true.B)
            c.io.dataOut.expect(dotProd.U)
        }
    }
}