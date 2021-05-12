package misc

import chisel3._
import chisel3.util._

class Chapter2(val elements: Int) extends Module {
    val io = IO(new Bundle {
//        val a = Input(UInt(16.W))
//        val b = Input(UInt(16.W))
//        val fn = Input(UInt(2.W))
//        val y = Output(UInt(16.W))
        val result = Input(UInt(32.W))
    })
    val fetch = Module(new Fetch())
    val decode = Module(new Decode())
    val execute = Module(new Execute())

    fetch.io <> decode.io
    decode.io <> execute.io
    io <> execute.io
}

class Fetch extends Module {
    val io = IO(new Bundle {
        val instr = Output(UInt(32.W))
        val pc = Output(UInt(32.W))
    })
}

class Decode extends Module {
    val io = IO(new Bundle {
        val instr = Input(UInt(32.W))
        val pc = Input(UInt(32.W))
        val aluOp = Output(UInt(5.W))
        val regA = Output(UInt(32.W))
        val regB = Output(UInt(32.W))
    })
}

class Execute extends Module {
    val io = IO(new Bundle {
        val aluOp = Input(UInt(5.W))
        val regA = Input(UInt(32.W))
        val regB = Input(UInt(32.W))
        val result = Output(UInt(32.W))
    })
}
