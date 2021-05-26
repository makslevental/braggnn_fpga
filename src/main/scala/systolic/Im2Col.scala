package systolic

import Chisel.{Counter, Queue, ShiftRegister, Valid}
import chisel3._
import chisel3.util.{log2Ceil, Decoupled}

import scala.collection.mutable.ArrayBuffer

//noinspection TypeAnnotation
class Im2Col[T <: Bits](
  val dtype:       T,
  val imgSize:     Int,
  val channels:    Int, // num filters or channels in
  val kernelSize:  Int,
  qSize:           Int,
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
    val dataIn = Flipped(Valid(Vec(channels, dtype.cloneType)))
    val dataOut = Valid(Vec(kernelSize * kernelSize * channels, outUInt.cloneType))
  })
  // TODO(max) 3 x 16 concatenated into a UInt48
  val dataInAsUInt = io.dataIn.bits.asInstanceOf[Vec[Bits]].map(_.asUInt()).reduce(_ ## _)
  val queueIOIn = Wire(Decoupled(dataInAsUInt.cloneType))
  queueIOIn.bits := dataInAsUInt
  queueIOIn.valid := io.dataIn.valid

  val uintBits = Wire(dataInAsUInt.cloneType)
  val vldIn = Wire(Bool())

  val q = Queue(queueIOIn, qSize)
  uintBits := q.deq()
  vldIn := RegNext(q.valid)

//  val rdy = Wire(Bool())
//  // TODO(max) queue should be outside?
//  if (fifo) {
//    val q = Queue(queueIOIn, qSize)
//    uintBits := q.deq()
//    vldIn := RegNext(q.valid)
//  } else {
//    uintBits := RegEnable(dataInAsUInt, rdy)
//    vldIn := RegEnable(io.dataIn.valid, false.B, rdy)
//    queueIOIn.ready := rdy
//  }

//  val cycleCntr = {
//    if (runtimeCycles > 1) {
//      val r = RegInit(0.U(runtimeCyclesBitWidth.W))
//      when(vldIn) {
//        r := r + 1.U(1.W)
//      }
//      r
//    } else
//      0.U(1.W)
//  }
//
//  rdy := !vldIn // TODO(max): ready when queue input is no longer valid? also this wire is reused? why?
//  when(cycleCntr === (runtimeCycles - 1).U(runtimeCyclesBitWidth.W)) {
//    rdy := true.B
//  }

//  val running = RegInit(false.B)
//  when(!running && io.dataIn.valid) {
//    running := true.B
//  }

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
  println("log2Ceil", log2Ceil(cyclesPerImage))
  println(runtimeCycles, inputCycles)
  println("colCntr", log2Ceil(imgSize * runtimeCycles * inputCycles) - 1, log2Ceil(runtimeCycles * inputCycles))
  imCol := inCntr(
    log2Ceil(imgSize * runtimeCycles * inputCycles) - 1,
    log2Ceil(runtimeCycles * inputCycles)
  )
  // Returns a subset of bits on this Bits from hi to lo (inclusive), statically addressed.
  // Params:
  // x – the high bit
  // y – the low bit
  imRow := inCntr(log2Ceil(cyclesPerImage) - 1, log2Ceil(imgSize * runtimeCycles * inputCycles))
  prevRow := imRow.asSInt() - 1.S
  printf("prevRow %d\n", prevRow)
  // TODO(max): removing this depends on runtimeCycles and inputCycles being one each
//  if (padding) {
//    val cyclesPerImagePad = imgSize * padAmt * runtimeCycles * inputCycles
//    val padStart = RegInit(false.B)
//    when(running & inCntrWrap) { // when wrap
//      padStart := true.B
//    }
//    val (padCntr, padCntrWrap) = Counter(padStart, cyclesPerImagePad)
//    when(padCntrWrap) {
//      padStart := false.B
//    }
//    val padDelay = RegNext(padStart)
//    when(padStart | padDelay) {
//      imRow := padCntr(
//        log2Ceil(imgSize * runtimeCycles * inputCycles) - 1,
//        log2Ceil(runtimeCycles * inputCycles)
//      )
//    }
//  }

//  println("rowCntr", log2Ceil(cyclesPerImage) - 1, log2Ceil(imgSize * runtimeCycles * inputCycles))
  printf("valid, colCntr, rowCntr  %d, %d, %d\n", vldIn, imCol, imRow)

  // TODO(max) invert the chopping?
  val bitsOut = Reg(Vec(channels, outUInt.cloneType))
  val dtypeWidth = dtype.getWidth // this is the actual transformation?
  for (i <- 0 until channels) {
    bitsOut(channels - i - 1) := uintBits(
      (i + 1) * dtypeWidth - 1 - outWidth * (runtimeCycles - 1),
      i * dtypeWidth
    )
//    for (j <- 1 until runtimeCycles) {
//      when(cycleCntr === j.U) {
//        bitsOut(channels - i - 1) := uintBits(
//          (i + 1) * dtypeWidth - 1 - outWidth * (runtimeCycles - 1 - j),
//          i * dtypeWidth + outWidth * j
//        )
//      }
//    }
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

  io.dataOut.bits := regOuts

  val latency = {
    if (padding)
      inputCycles * runtimeCycles * imgSize * (kernelSize - (padAmt + 1)) + (kernelSize - (padAmt + 1)) * runtimeCycles * inputCycles + 1
    else
      inputCycles * runtimeCycles * imgSize * (kernelSize - 1) + (kernelSize - 1) * runtimeCycles * inputCycles + 1
  }
  println("latency", latency)
  val vld = {
    if (stride == 2 && !padding) {
      val rowDelay = !imRow(0) && ShiftRegister(vldIn, 1, false.B, true.B)
      ShiftRegister(!imCol(0) && rowDelay, latency, false.B, true.B)
    } else
      ShiftRegister(vldIn, latency, false.B, true.B)
  }
  io.dataOut.valid := vld
}
