package myutil

import Chisel.{Counter, Decoupled, Queue, ShiftRegister, Valid}
import chisel3._
import chisel3.experimental.DataMirror
import chisel3.util.{isPow2, DeqIO, EnqIO, RegEnable}
import myutil.util.toggle

class RingBuffer[T <: Data](
  val gen:       T,
  val entriesIn: Int
//  val entriesOut: Int
) extends Module {
  require(entriesIn > -1, "Buffer must have non-negative number of entries")
  require(entriesIn != 0, "Use companion object Queue.apply for zero entries")
  val genType = if (DataMirror.internal.isSynthesizable(gen)) {
    chiselTypeOf(gen)
  } else {
    gen
  }
  // TODO(max): extend to handle slicing
  val entriesOut = 1

  val io = IO(new Bundle() {
    val inData = Flipped(Valid(Input(Vec(entriesIn, gen.cloneType))))
    val outData = Decoupled(Vec(entriesOut, gen.cloneType))
  })

  // Writes take effect on the rising clock edge after the request.
  val ram = Mem(entriesIn, genType)
  when(io.inData.valid) {
    for (i <- 0 until entriesIn) {
      ram(i) := io.inData.bits(i)
    }
  }

  val posEdge = io.inData.valid && !RegNext(io.inData.valid)

  io.outData.valid := !io.inData.valid || posEdge
  val (outputPtr, willWrap) = Counter(0 until entriesIn, io.outData.ready, io.inData.valid)
  io.outData.bits(0) := ram(outputPtr)
}
