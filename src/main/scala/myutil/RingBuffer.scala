package myutil

import Chisel.{Counter, Decoupled, Valid}
import chisel3._
import chisel3.experimental.DataMirror
import chisel3.util.{isPow2, DeqIO, EnqIO}

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
    val outData = Output(Vec(entriesOut, gen.cloneType))
  })

  val ram = Mem(entriesIn, genType)
  val (outputPtr, _) = Counter(!io.inData.valid, entriesIn)
  when(io.inData.valid) {
    for (i <- 0 until entriesIn) {
      ram(i) := io.inData.bits(i)
    }
  }

  io.outData(0) := ram(outputPtr)
}
