package systolic

import chisel3._

class WSProcElem(val bitWidth: Int = 8) extends Module {
  val io = IO(new Bundle {
    val inW   = Input(UInt(bitWidth.W))
    val inPS  = Input(UInt((bitWidth * 2).W))
    val inV   = Input(UInt(bitWidth.W))
    val outPS = Output(UInt((bitWidth * 2).W))
    val outV  = Output(UInt((bitWidth).W))
  })

  val psReg = RegInit(0.U((bitWidth * 2).W))
  val vReg  = RegInit(0.U(bitWidth.W))

  psReg := io.inPS + (io.inW * io.inV)
  vReg := io.inV

  io.outPS := psReg
  io.outV := vReg
}

object WSProcElem extends App {
//  chisel3.stage.ChiselStage.emitVerilog(() => RawModule)
  chisel3.Driver.execute(args, () => new WSProcElem)
}
