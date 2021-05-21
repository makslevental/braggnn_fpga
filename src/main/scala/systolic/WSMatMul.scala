package systolic

import chisel3._
import chisel3.stage.ChiselStage

//noinspection TypeAnnotation
class WSMatMul(rows: Int, cols: Int, bitWidth: Int = 8) extends Module {
  val io = IO(new Bundle {
    val A   = Input(Vec(rows, Vec(cols, UInt(bitWidth.W))))
    val B   = Input(Vec(cols, UInt(bitWidth.W)))
    val out = Output(Vec(rows, UInt((2 * bitWidth).W)))
  })

  val pElems = List.fill(rows)(
    List.fill(cols)(Module(new WSProcElem(bitWidth)).io)
  )

  val hWires = List.fill(rows)(
    List.fill(cols - 1)(Wire(UInt(bitWidth.W)))
  )

  val vWires = List.fill(rows - 1)(
    List.fill(cols)(Wire(UInt(bitWidth.W)))
  )

  // connecting PEs in a systolic manner
  for (row <- 0 until rows) {
    for (col <- 0 until cols) {
      pElems(row)(col).inW := io.A(row)(col)
      // wiring up PEs
      // horizontal inputs
      if (col == 0) pElems(row)(col).inPS := 0.U
      else pElems(row)(col).inPS := hWires(row)(col - 1)

      // horizontal outputs to next PEs
      if (col < cols - 1) hWires(row)(col) := pElems(row)(col).outPS

      // vertical inputs
      if (row == 0) pElems(row)(col).inV := io.B(col)
      else pElems(row)(col).inV := vWires(row - 1)(col)

      // vertical outputs to next PEs
      if (row < rows - 1) vWires(row)(col) := pElems(row)(col).outV
    }
    io.out(row) := pElems(row).last.outPS // results
  }

}

object WSMatMul extends App {
  (new ChiselStage).emitVerilog(new WSMatMul(2, 2))
}
