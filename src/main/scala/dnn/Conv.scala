// originally from https://github.com/da-steve101/binary_connect_cifar
package dnn

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util.Valid
import matmul.DotProduct

//noinspection TypeAnnotation
class Conv[T <: Bits](val dtype: T, val imgCols: Int, val kernel: Array[Array[Int]]) extends Module {
  val kSize = kernel.length
  val im2col = Module(new Im2ColMine(dtype, imgCols, kSize))
  val kernelDot = Module(new DotProduct(dtype, kSize * kSize))
  val io = IO(new Bundle {
    val inData = Flipped(Valid(Vec(imgCols, dtype.cloneType)))
    val outData = Output(kernelDot.io.y.cloneType)
//    val outData = Output(Vec(kSize * kSize, dtype.cloneType))
  })

  im2col.io.inData <> io.inData
  for {
    r <- 0 until kSize
    c <- 0 until kSize
  } kernelDot.io.a(r * kSize + c) := kernel(c)(r).asUInt()
  for (i <- 0 until kSize * kSize) {
    kernelDot.io.b(i) := im2col.io.outData(i)
  }
  io.outData := kernelDot.io.y
}

object Conv extends App {
  val imgCols = 10
  val kSize = 8
  val dWidth = 32

  val kernel = Array.tabulate(kSize, kSize) { (i, j) =>
    (i * kSize) + j
  }

  (new ChiselStage).emitVerilog(
    new Conv(
      UInt(dWidth.W),
      imgCols,
      kernel
    ),
    args
  )
}
