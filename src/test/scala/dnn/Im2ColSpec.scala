package dnn

import chisel3._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

import scala.util.Random

//noinspection TypeAnnotation
class Im2ColTests[T <: Bits](c: Im2Col[T]) extends PeekPokeTester(c) {
  val myRand = new Random
  val testImg = (1 until c.imgSize * c.imgSize * c.channels + 1)
    .map(i => {
      BigInt(i % (1 << 7))
    })
    .toList
  val noConvs = c.imgSize * c.imgSize * c.imgSize
  // >>> testImg = (np.arange(16*16*3) % (1 << 10)).reshape(16,16,3)
  // >>> np.pad(testImg, ((1,0),(1,0),(0,0)))[:,:,0]
  val padAmt = {
    if (c.padding)
      -(c.kernelSize / 2)
    else
      0
  }
  var convCounts = 0
  var imgIdx = 0
  var cyc = 0
  var convX = padAmt
  var convY = padAmt
  var inCyc = c.inputCycles
  var clock = 0
  while (convCounts < noConvs) {
    poke(c.io.inData.valid, true) // this is almost always in valid?
    for (i <- 0 until c.channels) {
      val testPix = testImg((imgIdx * c.channels + i) % (c.imgSize * c.imgSize))
      poke(c.io.inData.bits(i), testPix)
    }
    imgIdx += 1

    val vldOut = peek(c.io.outData.valid) == 1
    if (vldOut) {
//      val bits = peek(c.io.outData.bits).grouped(c.kernelSize).toArray.map(_.toArray).toArray
//      printArray(
//        bits,
//        "outData.bits"
//      )
      for (i <- 0 until c.kernelSize) {
        for (j <- 0 until c.kernelSize) {
          val convYi = convY + c.kernelSize - i - 1
          val convXj = convX + c.kernelSize - j - 1
          if (c.padding && (convYi < 0 || convXj < 0 || convYi >= c.imgSize || convXj >= c.imgSize)) {
            for (k <- 0 until c.channels)
              require(expect(c.io.outData.bits((i * c.kernelSize + j) * c.channels + k), BigInt(0)))
          } else {
            val idx = convYi * c.imgSize + convXj
            for (k <- 0 until c.channels) {
              val testValue =
                testImg(idx * c.channels + k) >> (cyc * c.outWidth)
              require(expect(c.io.outData.bits((i * c.kernelSize + j) * c.channels + k), testValue))
            }
          }
        }
      }
      cyc += 1
      if (cyc >= (c.inputCycles / c.throughput).toInt) {
        convX += c.stride
        cyc = 0
      }
      if (convX >= c.imgSize - (-padAmt)) {
        convX = padAmt
        convY += c.stride
      }
      if (convY >= c.imgSize - (-padAmt))
        convY = padAmt
      convCounts += 1
    }
    step(1)
    clock += 1
  }
}

class Im2ColSpec extends ChiselFlatSpec {
  behavior.of("Im2Col")
  val qSize = 15
  val stride = 1
  val padding = true
  val fifo = true
  val dWidth = 16
  val throughput = 1
  val inputCycle = 1
  for (inChannels <- 1 to 3) {
    for (kernelSize <- 1 until 4) {
      for (imgSize <- 4 until 7) {
        println(s"imgSize = ${math.pow(2, imgSize)} inChannels = $inChannels kernelSize = ${2 * kernelSize + 1}")
        Driver(
          () => {
            new Im2Col(
              UInt(dWidth.W),
              math.pow(2, imgSize).toInt,
              inChannels,
              2 * kernelSize + 1,
              qSize,
              stride,
              padding,
              throughput,
              inputCycle,
              fifo = fifo
            )
          },
          "treadle",
          verbose = false
        )(c => new Im2ColTests(c))

      }

    }
  }

}
