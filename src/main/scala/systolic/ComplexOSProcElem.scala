//package systolic
//
//import chisel3._
//import matmul.Complex
//
////noinspection TypeAnnotation
//class ComplexOSProcElem(val bitWidth: Int = 8) extends Module {
//  val io = IO(new Bundle {
//    val inH = Input(new Complex(bitWidth))
//    val inV = Input(new Complex(bitWidth))
//    val outH = Output(new Complex((bitWidth * 2)))
//    val outV = Output(new Complex((bitWidth * 2)))
//    val out = Output(new Complex((bitWidth * 2)))
//  })
//
//  val res = Module(new Complex(bitWidth * 2))
//  val hreg = Module(new Complex(bitWidth))
//  val vreg = Module(new Complex(bitWidth))
//
//  val im1 = RegNext(io.inH)
//  val im2 = RegNext(io.inV)
//
//  val ac = im1.real * im2.real; val bd = im1.imag * im2.imag; val ad = im1.real * im2.imag;
//  val bc = im1.imag * im2.real;
//
//  // this is the main computation part
//  res.real := ac - bd
//  res.imag := ad + bc
//
//  // inputs are delayed one cycle to next PEs
//  hreg := io.inH
//  vreg := io.inV
//
//  io.outH := io.inH
//  io.outV := io.inV
//  io.out.real := res.real
//  io.out.imag := res.imag
//}
