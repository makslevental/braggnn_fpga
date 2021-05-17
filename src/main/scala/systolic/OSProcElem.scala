package systolic

import chisel3._

class OSProcElem(val bitWidth: Int = 8) extends Module {
  val io = IO(new Bundle {
    val inH  = Input(UInt(bitWidth.W))
    val inV  = Input(UInt(bitWidth.W))
    val outH = Output(UInt((bitWidth * 2).W))
    val outV = Output(UInt((bitWidth * 2).W))
    val out  = Output(UInt((bitWidth * 2).W))
  })

  val res  = RegInit(0.U((bitWidth * 2).W))
  val hreg = RegInit(0.U(bitWidth.W))
  val vreg = RegInit(0.U(bitWidth.W))

  // this is the main computation part
  res := res + (io.inH * io.inV)

  // inputs are delayed one cycle to next PEs
  hreg := io.inH
  vreg := io.inV

  io.outH := hreg
  io.outV := vreg
  io.out := res
}
