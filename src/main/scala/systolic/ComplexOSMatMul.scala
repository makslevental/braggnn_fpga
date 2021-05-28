//package systolic
//
//import chisel3._
//import matmul.Complex
//
////noinspection TypeAnnotation
//class ComplexOSMatMul(rows: Int, cols: Int, bitWidth: Int) extends Module {
//  val io = IO(new Bundle {
//    val A = Input(Vec(rows, new Complex(bitWidth)))
//    val B = Input(Vec(cols, new Complex(bitWidth)))
//    val C = Output(Vec(rows, Vec(cols, new Complex((2 * bitWidth)))))
//  })
//
//  val pElems = List.fill(rows)(
//    List.fill(cols)(Module(new ComplexOSProcElem(bitWidth)).io)
//  )
//
//  val hWires = List.fill(rows)(
//    List.fill(cols - 1)(Wire(new Complex(bitWidth)))
//  )
//
//  val vWires = List.fill(rows - 1)(
//    List.fill(cols)(Wire(new Complex(bitWidth)))
//  )
//
//  // connecting PEs in a systolic manner
//  for (row <- 0 until rows) {
//    for (col <- 0 until cols) {
//      // wiring up PEs
//      // horizontal inputs
//      if (col == 0) pElems(row)(col).inH := io.A(row)
//      else pElems(row)(col).inH := hWires(row)(col - 1)
//
//      // horizontal outputs to next PEs
//      if (col < cols - 1) hWires(row)(col) := pElems(row)(col).outH
//
//      // vertical inputs
//      if (row == 0) pElems(row)(col).inV := io.B(col)
//      else pElems(row)(col).inV := vWires(row - 1)(col)
//
//      // vertical outputs to next PEs
//      if (row < rows - 1) vWires(row)(col) := pElems(row)(col).outV
//
//      io.C(row)(col) := pElems(row)(col).out // results
//    }
//  }
//
//}
