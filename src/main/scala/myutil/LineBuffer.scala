package myutil

import Chisel.{Counter, Valid}
import chisel3._
import chisel3.stage.ChiselStage

class LineBuffer[T <: Bits](val dtype: T, val colsIn: Int, val rowsOut: Int, val colsOut: Int) extends Module {
  val io = IO(new Bundle {
    val inData = Flipped(Valid(Vec(colsIn, dtype.cloneType)))
    val outData = Output(Vec(rowsOut, dtype.cloneType))
  })
  val (_colCntr, colCntrWillWrap) = Counter(!io.inData.valid, colsIn)
  val (rowCntr, _) = Counter(colCntrWillWrap, rowsOut)

  //  printf(p"colCntr ${_colCntr}, rowCntr ${rowCntr}\n")

  val rings = VecInit(Seq.fill(rowsOut) { Module(new RingBuffer(dtype, colsIn)).io })
  for (r <- 0 until rowsOut) {
    io.outData(r) := 0.U
    for (c <- 0 until colsIn) {
      rings(r).inData.valid := false.B
      rings(r).inData.bits(c) := 0.U
    }
  }

  when(io.inData.valid) {
    rings(rowCntr).inData.valid := true.B
    for (c <- 0 until colsIn) {
      rings(rowCntr).inData.bits(c) := io.inData.bits(c)
    }
  }.otherwise(
    for (r <- 0 until rowsOut) {
      rings(r).inData.valid := false.B
    }
  )

  // need to rotate here
  /*
    [1,2,3]
    [2,3,4]
    [3,4,5]

    [4,5,6]
   */
  for (r <- 0 until rowsOut) {
    val idx =
      ((((rowCntr.zext() - r.S((2 * rowCntr.getWidth).W)) % rowsOut.S(
        (2 * rowCntr.getWidth).W
      )) + rowsOut.S(
        (2 * rowCntr.getWidth).W
      )) % rowsOut.S((2 * rowCntr.getWidth).W)).asUInt()
//    printf(p"idx $idx\n")
    io.outData(idx) := rings(
      r
    ).outData(0)
  }

}

object LineBuffer extends App {
  val dWidth = 16
  (new ChiselStage).emitVerilog(
    new LineBuffer(
      dtype = UInt(dWidth.W),
      rowsOut = 8,
      colsIn = 128,
      colsOut = 128
    ),
    args
  )
}
