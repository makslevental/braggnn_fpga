package dnn

import chisel3._
import chisel3.util.Valid
import myutil.LineBuffer

class Im2KernelPatch[T <: Bits](val dtype: T, val cols: Int, val kSize: Int) extends Module {
  val io = IO(new Bundle {
    val inData = Flipped(Valid(Vec(cols, dtype.cloneType)))
    val outData = Output(Vec(kSize, Vec(kSize, dtype.cloneType)))
  })

  val lineBuffer = Module(new LineBuffer(dtype, cols, kSize))
  val kernelPatch = Module(new KernelShiftRegister(dtype, kSize))
  lineBuffer.io.inData <> io.inData
  kernelPatch.io.inData <> lineBuffer.io.outData

  for {
    i <- 0 until kSize
    j <- 0 until kSize
  } io.outData(i)(j) := kernelPatch.io.outData(i)(j)
}
