package systolic

import chisel3._
import chisel3.stage.ChiselStage

//noinspection TypeAnnotation
class WSProcElem(val bitWidth: Int = 8) extends Module {
  val io = IO(new Bundle {
    val inW = Input(UInt(bitWidth.W))
    val inPartialSum = Input(UInt((bitWidth * 2).W))
    val inV = Input(UInt(bitWidth.W))
    val outPartialSum = Output(UInt((bitWidth * 2).W))
    val outV = Output(UInt(bitWidth.W))
  })

  val psReg = RegInit(0.U((bitWidth * 2).W))
  val vReg = RegInit(0.U(bitWidth.W))

  psReg := io.inPartialSum + (io.inW * io.inV)
  vReg := io.inV

  io.outPartialSum := psReg
  io.outV := vReg
}

object WSProcElem extends App {
//  chisel3.stage.ChiselStage.emitVerilog(() => RawModule)
  val dWidth = 16

  (new ChiselStage).emitVerilog(
    new WSProcElem(
      dWidth
    ),
    args
  )
}
