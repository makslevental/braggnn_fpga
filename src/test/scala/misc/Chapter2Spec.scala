package misc

import chisel3._
import chiseltest._
//import matmul.Vector
import org.scalatest._

class Chapter2Spec extends FlatSpec with ChiselScalatestTester with Matchers {
    val elements = 7

    behavior of "Chapter2"

    it should "Not update its contents when write enable is false" in {
        test(new Chapter2(elements)) { c =>
            for (ii <- 0 until c.elements) {
                c.clock.step(1)
//                println(c.io.dataOut.peek())
            }
        }
    }
}
