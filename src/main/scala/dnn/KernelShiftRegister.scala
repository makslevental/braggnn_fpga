package dnn

import chisel3._
import chisel3.util.{ShiftRegister, Valid}

import scala.collection.mutable.ListBuffer

class KernelShiftRegister[T <: Bits](val dtype: T, val size: Int) extends Module {
  val io = IO(new Bundle {
    val inData = Flipped(Valid(Vec(size, dtype.cloneType)))
    val outData = Output(Vec(size, Vec(size, dtype.cloneType)))
  })

  val kernel = new ListBuffer[List[T]]()
  kernel += List.tabulate(size) { j => ShiftRegister(io.inData.bits(j), 1, io.inData.valid) }
  for (_ <- 1 until size) {
    kernel += List.tabulate(size) { j => ShiftRegister(kernel.last(j), 1, io.inData.valid) }
  }

  for {
    i <- 0 until size
    j <- 0 until size
  } io.outData(i)(j) := kernel(i)(j)
}
