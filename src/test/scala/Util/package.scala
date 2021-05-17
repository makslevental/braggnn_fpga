import scala.math.pow
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

  def printArray[T](arr: Array[T], name: String = "arr"): Unit = {
    println(s"$name: ${arr.deep}".replace("Array(", "\n[").replace(")", "]"))
  }

  class RandomArray(val len: Int, val bits: Int) {
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
