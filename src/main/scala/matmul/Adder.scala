package matmul

import chisel3._

/** Pipelined multiply and accumulate */
class MAC(aBits: Int = 8, bBits: Int = 8, cBits: Int = 16) extends Module {
    val outBits = Math.max(aBits + bBits, cBits) + 1
    val io = IO(new Bundle {
        val a = Input(SInt(aBits.W))
        val b = Input(SInt(bBits.W))
        val c = Input(SInt(cBits.W))
        val y = Output(SInt(outBits.W))
    })
    val mult = Wire(SInt((aBits + bBits).W))
    val add = Wire(SInt(outBits.W))
    val rA = RegNext(io.a)
    val rB = RegNext(io.b)
    val rC = RegNext(io.c)

    mult := rA * rB
    add := rC +& mult

    io.y := add
}


/** PipeAdder
 *
 * This unit loads input bits into register and performs addition in the next cycle
 */
class PipeAdder(aBits: Int = 8, bBits: Int = 8) extends Module {
    val outBits = Math.max(aBits, bBits) + 1
    val io = IO(
        new Bundle {
            val a = Input(SInt(aBits.W))
            val b = Input(SInt(bBits.W))
            val y = Output(SInt(outBits.W))
        }
    )

    val add = Wire(SInt(outBits.W))
    val rA = RegNext(io.a)
    val rB = RegNext(io.b)
    add := rA +& rB
    io.y := add
}

/** Adder
 *
 * This unit wires input bits to an adder directly.
 * The output comes out of combinational logic without waiting for another cycle.
 */
class Adder(aBits: Int = 8, bBits: Int = 8) extends Module {
    val outBits = Math.max(aBits, bBits) + 1
    val io = IO(new Bundle {
        val a = Input(SInt(aBits.W))
        val b = Input(SInt(bBits.W))
        val y = Output(SInt(outBits.W))
    })
    val add = Wire(SInt(outBits.W))
    val rA = Wire(SInt(aBits.W))
    val rB = Wire(SInt(bBits.W))
    rA := io.a
    rB := io.b
    add := rA +& rB
    io.y := add
}
