package dnn

import chisel3._
import chisel3.util.{Decoupled, ShiftRegister, Valid}

import scala.collection.mutable.ListBuffer

class KernelShiftRegister[T <: Bits](val dtype: T, val size: Int) extends Module {
  val io = IO(new Bundle {
    val inData = Flipped(Valid(Vec(size, dtype.cloneType)))
    val outData = Valid(Output(Vec(size, Vec(size, dtype.cloneType))))
  })

  val kernel = new ListBuffer[List[T]]()
  kernel += List.tabulate(size) { j => WireInit(io.inData.bits(j)) }
  for (_ <- 1 until size) {
    kernel += List.tabulate(size) { j => ShiftRegister(kernel.last(j), 1, 0.U.asInstanceOf[T], true.B) }
  }
  io.outData.valid := true.B

  for {
    i <- 0 until size
    j <- 0 until size
  } io.outData.bits(i)(j) := kernel(i)(j)
}
