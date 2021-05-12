package matmul

import chisel3._
import chiseltest._
import org.scalatest._

import scala.collection.immutable.{Vector => _}

class MatrixSpec extends FlatSpec with ChiselScalatestTester with Matchers {
    behavior of "Matrix"

    val rand = new scala.util.Random(100)
    val rowDims = 5
    val colDims = 3

    it should "Update its contents with a square shape" in {
        test(new Matrix(rowDims, colDims)) { c =>
            val inputs = List.fill(c.colsDim) {
                List.fill(c.rowsDim)(rand.nextInt(20) + 1)
            }

            c.io.writeEnable.poke(true.B)
            for (col <- 0 until c.colsDim) {
                for (row <- 0 until c.rowsDim) {
                    c.io.colIdx.poke(col.U)
                    c.io.rowIdx.poke(row.U)
                    c.io.dataIn.poke(inputs(col)(row).U)
                    c.clock.step(1)
                }
            }

            for (col <- 0 until c.colsDim) {
                for (row <- 0 until c.rowsDim) {
                    c.io.colIdx.poke(col.U)
                    c.io.rowIdx.poke(row.U)
                    c.io.dataOut.expect(inputs(col)(row).U)
                    c.clock.step(1)
                }
            }
        }
    }

    it should "Retain its contents when writeEnable is low" in {
        test(new Matrix(rowDims, colDims)) { c =>
            val inputs = List.fill(c.colsDim) {
                List.fill(c.rowsDim)(rand.nextInt(20) + 1)
            }

            c.io.writeEnable.poke(true.B)
            for (col <- 0 until c.colsDim) {
                for (row <- 0 until c.rowsDim) {
                    c.io.colIdx.poke(col.U)
                    c.io.rowIdx.poke(row.U)
                    c.io.dataIn.poke(inputs(col)(row).U)
                    c.clock.step(1)
                }
            }

            c.io.writeEnable.poke(false.B)
            for (col <- 0 until c.colsDim) {
                for (row <- 0 until c.rowsDim) {
                    c.io.colIdx.poke(col.U)
                    c.io.rowIdx.poke(row.U)
                    c.io.dataIn.poke(0.U)
                    c.clock.step(1)
                }
            }

            for (col <- 0 until c.colsDim) {
                for (row <- 0 until c.rowsDim) {
                    c.io.colIdx.poke(col.U)
                    c.io.rowIdx.poke(row.U)
                    c.io.dataOut.expect(inputs(col)(row).U)
                    c.clock.step(1)
                }
            }
        }
    }
}