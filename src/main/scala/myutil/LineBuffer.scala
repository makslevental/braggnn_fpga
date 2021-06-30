package myutil

import chisel3.util.{Counter, MuxLookup, Valid}
import chisel3._
import chisel3.stage.ChiselStage

//object LineBuffer {
//  def apply[T <: Data](in: T, n: Int, en: Bool = true.B): T = {
//    val memSR = Module(new MemShiftRegister(in, n))
//    memSR.io.en := en
//    memSR.io.in := in
//    memSR.io.out
//  }
//}

class LineBuffer[T <: Bits](val dtype: T, val colsIn: Int, val rowsOut: Int) extends Module {
  val io = IO(new Bundle {
    val inData = Flipped(Valid(Vec(colsIn, dtype.cloneType)))
    val outData = Valid(Vec(rowsOut, dtype.cloneType))
  })
  val (_colCntr, colCntrWillWrap) = Counter(!io.inData.valid, colsIn)
  val (rowCntr, _) = Counter(colCntrWillWrap, rowsOut)

  //  printf(p"colCntr ${_colCntr}, rowCntr ${rowCntr}\n")

  // initialization
  val rings = VecInit(Seq.fill(rowsOut) { Module(new RingBuffer(dtype, colsIn)).io })
  for (r <- 0 until rowsOut) {
    io.outData.bits(r) := 0.U
    for (c <- 0 until colsIn) {
      rings(r).inData.valid := false.B
      rings(r).inData.bits(c) := 0.U
    }
  }
  io.outData.valid := !io.inData.valid

  when(io.inData.valid) {
    rings(rowCntr).inData.valid := true.B
    for (c <- 0 until colsIn) {
      rings(rowCntr).inData.bits(c) := io.inData.bits(c)
    }
  }.otherwise {
    for (r <- 0 until rowsOut) {
      rings(r).inData.valid := false.B
    }
  }

//  rings(rowCntr).inData.valid := io.inData.valid
//  for (c <- 0 until colsIn) {
//    for (r <- 0 until rowsOut) {
//      when(rowCntr === r.U) {
//        rings(rowCntr).inData.bits(c) := io.inData.bits(c)
//        rings(rowCntr).inData.valid := true.B
//      }
//    }
//  }

  // need to rotate here
  /*
    [1,2,3]
    [2,3,4]
    [3,4,5]

    [4,5,6]
   */
  for (r <- 0 until rowsOut) {

    val idx = ((((rowCntr.zext() - r.S((2 * rowCntr.getWidth).W)) % rowsOut.S((2 * rowCntr.getWidth).W)) + rowsOut.S(
      (2 * rowCntr.getWidth).W
    )) % rowsOut.S((2 * rowCntr.getWidth).W)).asUInt()

    io.outData.bits(idx) := rings(
      r
    ).outData.bits(0)

//    MuxLookup
//    MuxLookup(idx, 0,  0 -> bits(0))
  }

  io.outData.valid := rings(0).outData.valid
}

object LineBuffer extends App {
  val dWidth = 16
  (new ChiselStage).emitFirrtl(
    new LineBuffer(dtype = UInt(dWidth.W), colsIn = 8, rowsOut = 3),
    args
  )
}
