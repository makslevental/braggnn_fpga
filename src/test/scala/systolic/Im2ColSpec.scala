package systolic

import chisel3._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import myutil.util.{prettyPrint, printArray}

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
  println(s"padAmt $padAmt")
  var convCounts = 0
  var imgIdx = 0
  var cyc = 0
  var convX = padAmt
  var convY = padAmt
  var inCyc = 0
  var clock = 0
  while (convCounts < noConvs) {
    poke(c.io.dataIn.valid, true) // this is almost always in valid?
    for (i <- 0 until c.channels) {
      val testPix = testImg((imgIdx * c.channels + i) % (c.imgSize * c.imgSize))
      val testValue = (testPix >> (c.dWidth * (inCyc / c.inputCycles))) % (1 << c.dWidth)
//      println(
//        s"clock $clock convCounts $convCounts channel $i imgIdx $imgIdx testPix $testPix testValue $testValue"
//      )
      poke(c.io.dataIn.bits(i), testValue)
    }
    imgIdx += 1

    val vldOut = peek(c.io.dataOut.valid) == 1
//    println(s"vldOut $vldOut")
//    printArray(
//      peek(c.io.dataOut.bits)
//        .grouped(c.channels)
//        .map(_.toArray)
//        .grouped(c.kernelSize)
//        .map(_.toArray)
//        .toArray,
//      "bits"
//    )
    if (vldOut) {
//      printArray(
//        peek(c.io.dataOut.bits).grouped(c.kernelSize).toArray,
//        "dataOut.bits"
//      )
      for (i <- 0 until c.kernelSize) {
        for (j <- 0 until c.kernelSize) {
          val convYi = convY + c.kernelSize - i - 1
          val convXj = convX + c.kernelSize - j - 1
          if (c.padding && (convYi < 0 || convXj < 0 || convYi >= c.imgSize || convXj >= c.imgSize)) {
//            for (k <- 0 until c.channels)
//              expect(c.io.dataOut.bits((i * c.kernelSize + j) * c.channels + k), BigInt(0))
          } else {
            val idx = convYi * c.imgSize + convXj
            for (k <- 0 until c.channels) {
//              val testValue =
//                (testImg(idx * c.channels + k) >> (cyc * c.outWidth)) % BigInt(1 << c.outWidth)
//              expect(c.io.dataOut.bits((i * c.kernelSize + j) * c.channels + k), testValue)
            }
          }
        }
      }
      cyc += 1
      if (cyc >= (c.inputCycles / c.throughput).toInt) {
        convX += c.stride
        cyc = 0
      }
      if (convX >= c.imgSize - 1) {
        convX = padAmt
        convY += c.stride
      }
      if (convY >= c.imgSize - 1)
        convY = padAmt
      convCounts += 1
    }
    step(1)
    clock += 1
  }
}

class Im2ColSpec extends ChiselFlatSpec {
  behavior.of("Im2Col")
  val inChannels = 1
  val qSize = 15
  val kernelSize = 5
  val stride = 1
  val imgSize = 16
  val padding = true
  val fifo = true
  val dWidth = 16
  val throughput = 1
  val inputCycle = 1
  println(
//    s"imgSize = $imgSize inChannels = $inChannels kernelSize = $kernelSize qSize = $qSize " +
//      s"stride = $stride padding = $padding throughput = $throughput fifo = $fifo"
  )
  Driver(
    () => {
      new Im2Col(
        UInt(dWidth.W),
        imgSize,
        inChannels,
        kernelSize,
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
