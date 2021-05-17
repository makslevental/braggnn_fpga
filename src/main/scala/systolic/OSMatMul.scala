package systolic

import chisel3._

class OSMatMul(rows: Int, cols: Int, bitWidth: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(Vec(rows, UInt(bitWidth.W)))
    val B = Input(Vec(cols, UInt(bitWidth.W)))
    val C = Output(Vec(rows, Vec(cols, UInt((2 * bitWidth).W))))
  })

  val pElems = List.fill(rows)(
    List.fill(cols)(Module(new OSProcElem(bitWidth)).io)
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
      // wiring up PEs
      // horizontal inputs
      if (col == 0) pElems(row)(col).inH := io.A(row)
      else pElems(row)(col).inH := hWires(row)(col - 1)

      // horizontal outputs to next PEs
      if (col < cols - 1) hWires(row)(col) := pElems(row)(col).outH

      // vertical inputs
      if (row == 0) pElems(row)(col).inV := io.B(col)
      else pElems(row)(col).inV := vWires(row - 1)(col)

      // vertical outputs to next PEs
      if (row < rows - 1) vWires(row)(col) := pElems(row)(col).outV

      io.C(row)(col) := pElems(row)(col).out // results
    }
  }

}
