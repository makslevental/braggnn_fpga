// originally from https://github.com/da-steve101/binary_connect_cifar
package dnn

import chisel3._
import chisel3.util.Valid

//noinspection TypeAnnotation
class Im2ColMine[T <: Bits](val dtype: T, val cols: Int, val kSize: Int) extends Module {
  val io = IO(new Bundle {
    val inData = Flipped(Valid(Vec(cols, dtype.cloneType)))
    val outData = Output(Vec(kSize * kSize, dtype.cloneType))
  })

  val im2KernelPatch = Module(new Im2KernelPatch(dtype, cols, kSize))
  im2KernelPatch.io.inData <> io.inData

  val reversedOut = Wire(Vec(kSize * kSize, dtype.cloneType))
  for {
    r <- 0 until kSize
    c <- 0 until kSize
  } reversedOut(r * kSize + c) := im2KernelPatch.io.outData(c)(r)
  io.outData <> reversedOut.reverse
}
