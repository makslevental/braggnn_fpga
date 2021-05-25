package myutil

import scala.math.pow
import scala.reflect.runtime.currentMirror
import scala.reflect.runtime.{universe => ru}
import scala.sys.process._
import scala.tools.reflect.ToolBox
import scala.util.Random
import scala.reflect.ClassTag

object util {
  def matMatMult(
    A: Array[Array[Int]],
    B: Array[Array[Int]]
  ): Array[Array[Int]] = {
    B.transpose.map(b => matVecMult(A, b, 0)).transpose
  }

  def matVecMult(
    mat:   Array[Array[Int]],
    vec:   Array[Int],
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

  def conv[T](
    img:    Array[Array[Array[T]]],
    kernel: Array[Array[Array[Array[T]]]]
  )(
    implicit n: Numeric[T]
  ): Array[Array[Array[Double]]] = {
    import n._

    val imChannels = img.length
    val imHeight = img.head.length
    val imWidth = img.head.head.length

    val nFilters = kernel.length
    require(kernel.head.length == imChannels)
    val kHeight = kernel.head.head.length
    val kWidth = kernel.head.head.head.length

    val outputHeight = imHeight - kHeight + 1
    val outputWidth = imWidth - kWidth + 1

    val out = Array.fill(nFilters, outputHeight, outputWidth)(0.0)

    for (f <- 0 until nFilters) {
      for (c <- 0 until imChannels) {
        for (oH <- 0 until outputHeight) {
          for (oW <- 0 until outputWidth) {
            for (kH <- 0 until kHeight) {
              for (kW <- 0 until kWidth) {
                out(f)(oH)(oW) += kernel(f)(c)(kH)(kW).toDouble * img(c)(oH + kH)(oW + kW).toDouble
              }
            }
          }
        }
      }
    }
    out
  }

  def im2col[T](
    img:    Array[Array[Array[T]]],
    kernel: Array[Array[Array[Array[T]]]]
  )(
    implicit n: Numeric[T],
    c:          ClassTag[T]
  ): (Array[Array[T]], Array[Array[T]]) = {
    import n._

    val nFilters = kernel.length
    val kHeight = kernel.head.head.length
    val kWidth = kernel.head.head.head.length
    val imChannels = img.length
    val imHeight = img.head.length
    val imWidth = img.head.head.length

    val kMatrixRows = nFilters
    val kMatrixCols = kHeight * kWidth * imChannels

    val nKernelPositions = (imHeight - kHeight + 1) * (imWidth - kWidth + 1)

    val imMatrixRows = kHeight * kWidth * imChannels
    val imMatrixCols = nKernelPositions

    val imPatches = for {
      channel <- img
      rows <- channel.sliding(kHeight, 1)
      patch <- rows.transpose.sliding(kWidth, 1)
    } yield patch.transpose.flatten

    val imMatrix =
      imPatches.grouped(imPatches.length / imChannels).map(_.transpose).toArray.flatten

    require(imMatrix.length == imMatrixRows && imMatrix.head.length == imMatrixCols)

    var kMatrix = for {
      filterBank <- kernel
      channel <- filterBank
    } yield channel.flatten

    kMatrix = kMatrix.grouped(kMatrix.length / nFilters).map(_.flatten).toArray

    require(kMatrix.length == kMatrixRows && kMatrix.head.length == kMatrixCols)

    (imMatrix, kMatrix)
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

  /** Pretty prints a Scala value similar to its source represention.
    * Particularly useful for case classes.
    *
    * @param a - The value to pretty print.
    * @param indentSize - Number of spaces for each indent.
    * @param maxElementWidth - Largest element size before wrapping.
    * @param depth - Initial depth to pretty print indents.
    * @return
    */
  def prettyPrint(a: Any, indentSize: Int = 2, maxElementWidth: Int = 30, depth: Int = 0): String = {
    val indent = " " * depth * indentSize
    val fieldIndent = indent + (" " * indentSize)
    val nextDepth = prettyPrint(_: Any, indentSize, maxElementWidth, depth + 1)
    a match {
      case s: String =>
        val replaceMap = Seq(
          "\n" -> "\\n",
          "\r" -> "\\r",
          "\t" -> "\\t",
          "\"" -> "\\\""
        )
        '"' + replaceMap.foldLeft(s) { case (acc, (c, r)) => acc.replace(c, r) } + '"'
      case opt: Some[_] =>
        val resultOneLine = s"Some(${nextDepth(opt.get)})"
        if (resultOneLine.length <= maxElementWidth) return resultOneLine
        s"Some(\n$fieldIndent${nextDepth(opt.get)}\n$indent)"
      case xs: Seq[_] if xs.isEmpty =>
        xs.toString()
      case map: Map[_, _] if map.isEmpty =>
        map.toString()
      case xs: Map[_, _] =>
        val result = xs.map { case (key, value) => s"\n$fieldIndent${nextDepth(key)} -> ${nextDepth(value)}" }.toString
        "Map" + s"${result.substring(0, result.length - 1)}\n$indent)".substring(4)
      // Make Strings look similar to their literal form.
      // For an empty Seq just use its normal String representation.
      case xs: Seq[_] =>
        // If the Seq is not too long, pretty print on one line.
        val resultOneLine = xs.map(nextDepth).toString()
        if (resultOneLine.length <= maxElementWidth) return resultOneLine
        // Otherwise, build it with newlines and proper field indents.
        val result = xs.map(x => s"\n$fieldIndent${nextDepth(x)}").toString()
        result.substring(0, result.length - 1) + "\n" + indent + ")"
      // Product should cover case classes.
      case p: Product =>
        val prefix = p.productPrefix
        // We'll use reflection to get the constructor arg names and values.
        val cls = p.getClass
        val fields = cls.getDeclaredFields.filterNot(_.isSynthetic).map(_.getName)
        val values = p.productIterator.toSeq
        // If we weren't able to match up fields/values, fall back to toString.
        if (fields.length != values.length) return p.toString
        fields.zip(values).toList match {
          // If there are no fields, just use the normal String representation.
          case Nil => p.toString
          // If there is more than one field, build up the field names and values.
          case kvps =>
            val prettyFields = kvps.map { case (k, v) => s"$k = ${nextDepth(v)}" }
            // If the result is not too long, pretty print on one line.
            val resultOneLine = s"$prefix(${prettyFields.mkString(", ")})"
            if (resultOneLine.length <= maxElementWidth) return resultOneLine
            // Otherwise, build it with newlines and proper field indents.
            s"$prefix(\n${kvps.map { case (k, v) => s"$fieldIndent$k = ${nextDepth(v)}" }.mkString(",\n")}\n$indent)"
        }
      // If we haven't specialized this type, just use its toString.
      case _ => a.toString
    }
  }

}

//noinspection TypeAnnotation
object HelloWorld {
  def main(args: Array[String]): Unit = {
    testIm2Col()
  }

  def testIm2Col(): Unit = {
    val imChannels = 3
    val imHeight = 3
    val imWidth = 3

    val nFilters = 2
    val kHeight = 2
    val kWidth = 2
    val img = Array.tabulate(imChannels, imHeight, imWidth) { (i, j, k) =>
      i * (imHeight * imWidth) + j * imWidth + k
    }

//    Util.printArray(img, "img")

    val kernel = Array.tabulate(nFilters, imChannels, kHeight, kWidth) { (i, j, k, l) =>
      i * (imChannels * kHeight * kWidth) + j * (kHeight * kWidth) + k * kWidth + l
    }

    util.printArray(kernel, "kernel")

    util.im2col(img, kernel)
  }

  def testConv(): Unit = {
    val repeats = 10
    for (i <- 0 until repeats) {
      val (img, kernel, trueOutput) = callPythonToMakeTensors()
      val output = util.conv(img, kernel)
      val o = output.flatten.flatten
      val t = trueOutput.flatten.flatten
      require(o.length == t.length)
      (o, t).zipped.foreach((x, y) => require(~=(x, y, 0.01), s"$x $y"))
      println(s"test $i success")
    }
  }

  def ~=(x: Double, y: Double, precision: Double): Boolean = {
    if ((x - y).abs < precision) true else false
  }

  def getTypeTag[T: ru.TypeTag](obj: T) = ru.typeTag[T]

  type Img = Array[Array[Array[Double]]]
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
        |img = torch.randint(10,100, (1,c,h,w))
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
