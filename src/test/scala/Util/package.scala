import scala.math.pow
import scala.reflect.runtime.currentMirror
import scala.reflect.runtime.{universe => ru}
import scala.sys.process._
import scala.tools.reflect.ToolBox
import scala.util.Random

package object Util {
  def matMatMult(
      A: Array[Array[Int]],
      B: Array[Array[Int]]
  ): Array[Array[Int]] = {
    B.transpose.map(b => matVecMult(A, b, 0)).transpose
  }

  def matVecMult(
      mat: Array[Array[Int]],
      vec: Array[Int],
      shift: Int
  ): Array[Int] = {
    val res = Array.fill(mat.length) {
      0
    }
    for (i <- mat.indices) {
      var dot = 0
      for (j <- mat(i).indices) {
        dot += mat(i)(j) * vec(j)
      }
      res(i) = dot * pow(2, shift).toInt
    }
    res
  }

  def conv(
      img: Array[Array[Array[Double]]],
      kernel: Array[Array[Array[Array[Double]]]]
  ): Array[Array[Array[Double]]] = {
    val imChannels = img.length
    val imHeight   = img.head.length
    val imWidth    = img.head.head.length

    val nFilters = kernel.length
    require(kernel.head.length == imChannels)
    val kHeight = kernel.head.head.length
    val kWidth  = kernel.head.head.head.length

    val outputHeight = (imHeight - kHeight + 1)
    val outputWidth  = (imWidth - kWidth + 1)

    val out = Array.fill(nFilters, outputHeight, outputWidth)(0.0)

    for (f <- 0 until nFilters) {
      for (c <- 0 until imChannels) {
        for (oH <- 0 until outputHeight) {
          for (oW <- 0 until outputWidth) {
            for (kH <- 0 until kHeight) {
              for (kW <- 0 until kWidth) {
                out(f)(oH)(oW) += kernel(f)(c)(kH)(kW) * img(c)(oH + kH)(oW + kW)
              }
            }
          }
        }
      }
    }
    out
  }

  def printArray[T](arr: Array[T], name: String = "arr"): Unit = {
    println(s"$name: ${arr.deep}".replace("Array(", "\n[").replace(")", "]"))
  }

  class RandomVector(val len: Int, val bits: Int) {
    val r = new Random
    if (bits < 1) throw new IllegalArgumentException("bits should be greater than 1")

    def any: Array[Int] = {
      Array.fill(len) { r.nextInt(pow(2, bits).toInt) - pow(2, bits - 1).toInt }
    }

    def positive: Array[Int] = {
      Array.fill(len) { r.nextInt(pow(2, bits - 1).toInt) }
    }

    def negative: Array[Int] = {
      Array.fill(len) { 0 - r.nextInt(pow(2, bits - 1).toInt) }
    }

    def smallpos: Array[Int] = {
      Array.fill(len) { r.nextInt(10) }
    }
  }

  object helper {
    def getMask(bits: Int): Long = {
      if (bits <= 0) throw new IllegalArgumentException("bits should be greater than 0")
      (pow(2, bits) - 1).toLong
    }
  }

}
object HelloWorld {
  def main(args: Array[String]): Unit = {
    val repeats = 10
    for (i <- 0 until repeats) {
      val (img, kernel, trueOutput) = callPythonToMakeTensors()
      val output                    = Util.conv(img, kernel)
      val o                         = output.flatten.flatten
      val t                         = trueOutput.flatten.flatten
      require(o.length == t.length)
      (o, t).zipped.foreach((x, y) => require(~=(x, y, 0.01), s"$x $y"))
      println(s"test $i success")
    }
  }

  def ~=(x: Double, y: Double, precision: Double): Boolean = {
    if ((x - y).abs < precision) true else false
  }

  def getTypeTag[T: ru.TypeTag](obj: T) = ru.typeTag[T]

  type Img    = Array[Array[Array[Double]]]
  type Kernel = Array[Array[Array[Array[Double]]]]
  type Output = Array[Array[Array[Double]]]

  def callPythonToMakeTensors(): (Img, Kernel, Output) = {
    val code =
      """
        |import torch
        |import random
        |torch.set_printoptions(profile="full")
        |
        |k = random.randint(1,10)
        |c = random.randint(1,10)
        |h = random.randint(k,10)
        |w = random.randint(k,10)
        |f = random.randint(1,10)
        |
        |img = torch.randn(1,c,h,w)
        |img = img.float()
        |print(img),0
        |print("###")
        |print("img shape", img.shape),1
        |print("###")
        |conop = torch.nn.Conv2d(c, f, k, bias=False)
        |print(conop.weight.data),2
        |print("###")
        |print("conop shape", conop.weight.shape),3
        |print("###")
        |print(conop(img).data),4
        |print("###")
        |print("conv shape", conop(img).shape),5
        |print()
      """.stripMargin

    val (_exitValue, stout, sterr) =
      runCommand("/Users/maksim/.conda/envs/MERF-FSP/bin/python", "-c", code)

    print(sterr)
    val arrays =
      stout
        .replace("tensor(", "")
        .replace(")", "")
        .replace("[", "Array(")
        .replace("]", ")")
        .split("###")
//    Util.printArray(arrays)
    println(sterr)
//    println(arrays.deep)
    val toolbox = currentMirror.mkToolBox()

//    val code1 = q"""new String("hello")"""
    var img = new Img(0)
    try {
      img = toolbox.eval(toolbox.parse(arrays(0))).asInstanceOf[Array[Img]](0)
    } catch {
      case _ =>
        println(arrays(0))
        throw new RuntimeException()
    }
//    Util.printArray(img)
    var kernel = new Kernel(0)
    try {
      kernel = toolbox.eval(toolbox.parse(arrays(2))).asInstanceOf[Kernel]
    } catch {
      case _ =>
        println(arrays(2))
        throw new RuntimeException()
    }
//    Util.printArray(kernel)
//    val outputDims =
//      toolbox.eval(toolbox.parse(arrays(4))).asInstanceOf[Array[Int]]
//    Util.printArray(outputDims)
    var output = new Output(0)
    try {
      output = toolbox.eval(toolbox.parse(arrays(4))).asInstanceOf[Array[Output]](0)
    } catch {
      case _ =>
        println(arrays(4))
        throw new RuntimeException()
    }
//    Util.printArray(output)

    (img, kernel, output)
  }

  def runCommand(cmd: String*): (Int, String, String) = {
    val stdoutStream = new java.io.ByteArrayOutputStream
    val stderrStream = new java.io.ByteArrayOutputStream
    val stdoutWriter = new java.io.PrintWriter(stdoutStream)
    val stderrWriter = new java.io.PrintWriter(stderrStream)
    val exitValue =
      cmd.!(ProcessLogger(stdoutWriter.println, stderrWriter.println))
    stdoutWriter.close()
    stderrWriter.close()
    (exitValue, stdoutStream.toString, stderrStream.toString)
  }
}
