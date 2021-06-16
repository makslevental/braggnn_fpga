// originally from https://github.com/da-steve101/binary_connect_cifar
package myutil

import Chisel.{Counter, Queue, ShiftRegister, Valid}
import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util.{log2Ceil, Decoupled}

import scala.collection.mutable.ArrayBuffer

//noinspection TypeAnnotation
class Im2Col[T <: Bits](
  val dtype:       T,
  val imgSize:     Int,
  val channels:    Int, // num filters or channels in
  val kernelSize:  Int,
  val qSize:       Int,
  val stride:      Int,
  val padding:     Boolean,
  val throughput:  Double,
  val inputCycles: Int,
  val fifo:        Boolean = true)
    extends Module {

  val dWidth = dtype.getWidth
  val outWidth = (dWidth * throughput).toInt
  val outUInt = UInt(width = outWidth.W)
  val runtimeCycles = dtype.getWidth / outWidth // TODO(max) output cycles?
  val runtimeCyclesBitWidth = {
    if (log2Ceil(runtimeCycles) == 0)
      1
    else
      log2Ceil(runtimeCycles)
  }

  val io = IO(new Bundle {
    val inData = Flipped(Valid(Vec(channels, dtype.cloneType)))
    val outData = Valid(Vec(kernelSize * kernelSize * channels, outUInt.cloneType))
  })
  // TODO(max) 3 x 16 concatenated into a UInt48
  val inDataAsUInt = io.inData.bits.asInstanceOf[Vec[Bits]].map(_.asUInt()).reduce(_ ## _)
  val queueIOIn = Wire(Decoupled(inDataAsUInt.cloneType))
  queueIOIn.bits := inDataAsUInt
  queueIOIn.valid := io.inData.valid

  val uintBits = Wire(inDataAsUInt.cloneType)
  val vldIn = Wire(Bool())

  val q = Queue(queueIOIn, qSize)
  uintBits := q.deq()
  vldIn := RegNext(q.valid)

  val padAmt = {
    if (padding)
      kernelSize / 2
    else
      0
  }
  val cyclesPerImage = imgSize * imgSize * runtimeCycles * inputCycles
  val (inCntr, inCntrWrap) = Counter(vldIn, cyclesPerImage)
  val imCol = Wire(UInt(width = log2Ceil(imgSize).W))
  val imRow = Wire(UInt(width = log2Ceil(imgSize).W))
  val prevRow = Wire(SInt(width = log2Ceil(imgSize + 1).W))
  imCol := inCntr(
    log2Ceil(imgSize * runtimeCycles * inputCycles) - 1,
    log2Ceil(runtimeCycles * inputCycles)
  )
  imRow := inCntr(log2Ceil(cyclesPerImage) - 1, log2Ceil(imgSize * runtimeCycles * inputCycles))
  prevRow := imRow.asSInt() - 1.S

  // TODO(max) invert the chopping?
  val bitsOut = Reg(Vec(channels, outUInt.cloneType))
  val dtypeWidth = dtype.getWidth // this is the actual transformation?
  for (i <- 0 until channels) {
    bitsOut(channels - i - 1) := uintBits(
      (i + 1) * dtypeWidth - 1 - outWidth * (runtimeCycles - 1),
      i * dtypeWidth
    )
  }

  val noReg = (kernelSize - 1) * (runtimeCycles * inputCycles)
  val bufferSize = runtimeCycles * inputCycles * imgSize - noReg

  val outputs = ArrayBuffer[Vec[UInt]]()
  outputs.append(bitsOut)
  // TODO(max) hook up stacks of registers to bitsOut? this is the pic from the paper with the buffer
  for (i <- 0 until kernelSize) {
    var currVec = outputs.last
    for (j <- 1 until kernelSize) {
      for (c <- 0 until runtimeCycles * inputCycles)
        currVec = RegNext(currVec)
      outputs.append(currVec)
    }
    if (i < kernelSize - 1) {
      val mb = MemShiftRegister(currVec, bufferSize, true.B)
      outputs.append(mb)
    }
  }

  val outs = outputs.toList.map(_.toList)
  val regOuts = Reg(VecInit(outs.reduce(_ ++ _)).cloneType)
  if (padding) for (kRow <- 0 until kernelSize) {
    for (kCol <- 0 until kernelSize) {
      val outsIdx = kRow * kernelSize + kCol
      val outAtRowCol = outs(outsIdx)
      for ((outAtRowColCh, ch) <- outAtRowCol.zipWithIndex) {
        val regOutIdx = outsIdx * channels + ch
        regOuts(regOutIdx) := outAtRowColCh

        when(padAmt.U <= imCol && imCol < kCol.U) {
          regOuts(regOutIdx) := 0.U
        }.elsewhen(kCol.U <= imCol && imCol < padAmt.U) {
          regOuts(regOutIdx) := 0.U
        }

        when(imCol < padAmt.U) {
          when(padAmt.S <= prevRow && prevRow < kRow.S) {
            regOuts(regOutIdx) := 0.U
          }
          when(kRow.S <= prevRow && prevRow < padAmt.S) {
            regOuts(regOutIdx) := 0.U
          }
        }.otherwise {
          when(padAmt.U <= imRow && imRow < kRow.U) {
            regOuts(regOutIdx) := 0.U
          }
          when(kRow.U <= imRow && imRow < padAmt.U) {
            regOuts(regOutIdx) := 0.U
          }
        }
      }
    }
  }

  io.outData.bits := regOuts

  val latency =
    inputCycles * runtimeCycles * imgSize * (kernelSize - (padAmt + 1)) + (kernelSize - (padAmt + 1)) * runtimeCycles * inputCycles + 1
  val vld = ShiftRegister(vldIn, latency, false.B, true.B)
  io.outData.valid := vld
}

object Im2Col extends App {
  val qSize = 15
  val stride = 1
  val padding = true
  val fifo = true
  val dWidth = 16
  val throughput = 1
  val inputCycle = 1
  val imgSize = 32
  val inChannels = 1
  val kernelWidth = 3

  (new ChiselStage).emitVerilog(
    new Im2Col(
      UInt(dWidth.W),
      32,
      inChannels,
      2 * kernelWidth + 1,
      qSize,
      stride,
      padding,
      throughput,
      inputCycle,
      fifo = fifo
    ),
    args
  )
}
