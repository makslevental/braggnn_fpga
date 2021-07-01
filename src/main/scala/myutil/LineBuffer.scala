package myutil

import chisel3.util.{Arbiter, Counter, MuxLookup, Valid}
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

  io.outData.valid := !io.inData.valid

  // initialization
  val rings = VecInit(Seq.fill(rowsOut) { Module(new RingBuffer(dtype, colsIn)).io })
  for (r <- 0 until rowsOut) {
    io.outData.bits(r) := 0.U
    for (c <- 0 until colsIn) {
      rings(r).inData.valid := false.B
      rings(r).inData.bits(c) := 0.U
      rings(r).outData.ready := !io.inData.valid
    }
  }

  when(io.inData.valid) {
    rings(rowCntr).inData.valid := true.B
    rings(rowCntr).outData.ready := false.B
    for (c <- 0 until colsIn) {
      rings(rowCntr).inData.bits(c) := io.inData.bits(c)
    }
  }.otherwise {
    for (r <- 0 until rowsOut) {
      rings(r).inData.valid := false.B
    }
  }

  // need to rotate here
  /*
    [1,2,3]
    [2,3,4]
    [3,4,5]

    [4,5,6]
   */

  def rotater(rowsOut: Int) = {
    val ms = scala.collection.mutable.Map[(Int, Int), Int]()
    var rowCntr = 0
    for (col <- 0 until colsIn * rowsOut) {
      if ((col + 1) % colsIn == 0) rowCntr += 1
      if (rowCntr >= rowsOut) rowCntr = 0
      for (r <- 0 until rowsOut) {
        ms((r, rowCntr)) = Math.floorMod(rowCntr - r, rowsOut)
      }
    }
    val mss = ms.flatMap { case ((r, rowCntr), idx) => List((r * rowsOut + rowCntr, idx)) }.toList.sorted
    require(Set(mss.map(_._1)) == Set(0 until rowsOut * rowsOut))
    VecInit(mss.map(_._2.asUInt()))
  }

  val rot = rotater(rowsOut)

  for (r <- 0 until rowsOut) {
    val ring = rings(r)

//    val idx = ((((rowCntr.zext() - r.S((2 * rowCntr.getWidth).W)) % rowsOut.S((2 * rowCntr.getWidth).W)) + rowsOut.S(
//      (2 * rowCntr.getWidth).W
//    )) % rowsOut.S((2 * rowCntr.getWidth).W)).asUInt()
//    printf("%d,%d,%d\n", r.asUInt(), rowCntr, idx)

    val idx = rot(r.asUInt() * rowsOut.asUInt() +& rowCntr.asUInt())
    io.outData.bits(idx) := Mux(ring.outData.valid, ring.outData.bits(0), 0.U.asInstanceOf[T])
  }

  io.outData.valid := rings.map { r => r.outData.valid }.reduce { (r1, r2) => r1 && r2 }
}

object LineBuffer extends App {
  val dWidth = 16
  (new ChiselStage).emitFirrtl(
    new LineBuffer(dtype = UInt(dWidth.W), colsIn = 8, rowsOut = 3),
    args
  )
}
