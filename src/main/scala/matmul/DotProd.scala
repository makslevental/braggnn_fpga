package matmul

import chisel3._
import chisel3.util.Counter

class DotProd(val elements: Int) extends Module {
    val io = IO(
        new Bundle {
            val dataInA = Input(UInt(32.W))
            val dataInB = Input(UInt(32.W))

            val dataOut = Output(UInt(32.W))
            val outputValid = Output(Bool())
        }
    )
    io.dataOut := 0.U
    io.outputValid := false.B
    val accumulator = RegInit(0.U(32.W))

    val product = io.dataInA * io.dataInB
    accumulator := accumulator + product

    val (counterValue, counterWrap) = Counter(true.B, elements)
    val done = RegNext(counterWrap, init=false.B)
    when(done) {
        io.dataOut := accumulator
        io.outputValid := true.B
    }
}
