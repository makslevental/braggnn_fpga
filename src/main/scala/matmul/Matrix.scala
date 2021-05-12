package matmul

import chisel3._

// This import statement makes the scala vector invisible, reducing confusion
import scala.collection.immutable.{Vector => _}

class Matrix(val rowsDim: Int, val colsDim: Int) extends Module {

    val io = IO(
        new Bundle {
            val colIdx: UInt = Input(UInt(32.W))
            val rowIdx: UInt = Input(UInt(32.W))
            val dataIn: UInt = Input(UInt(32.W))
            val writeEnable: Bool = Input(Bool())

            val dataOut: UInt = Output(UInt(32.W))
        }
    )

    val rows = VecInit(Seq.fill(rowsDim) {
        Module(new Vector(colsDim)).io
    })

    for (ii <- 0 until rowsDim) {
        rows(ii).dataIn := 0.U
        rows(ii).writeEnable := false.B
        rows(ii).idx := 0.U
    }

    val row = rows(io.rowIdx)
    row.idx := io.colIdx
    io.dataOut := row.dataOut
    when(io.writeEnable) {
        row.writeEnable := true.B
        row.dataIn := io.dataIn
        io.dataOut := row.dataOut
    }

}
