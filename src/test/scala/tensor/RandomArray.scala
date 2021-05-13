package tensor

import scala.util.Random
import scala.math.pow

class RandomArray(val len: Int, val bits: Int) {
    val r = new Random
    if (bits < 1) throw new IllegalArgumentException ("bits should be greater than 1")

    def any : Array[Int] = {
        Array.fill(len) { r.nextInt(pow(2, bits).toInt) - pow(2, bits-1).toInt }
    }

    def positive : Array[Int] = {
        Array.fill(len) { r.nextInt(pow(2, bits-1).toInt) }
    }

    def negative : Array[Int] = {
        Array.fill(len) { 0 - r.nextInt(pow(2, bits-1).toInt) }
    }

    def smallpos : Array[Int] = {
        Array.fill(len) { r.nextInt(10) }
    }
}


object helper {
    def getMask(bits: Int) : Long = {
        if (bits <= 0) throw new IllegalArgumentException ("bits should be greater than 0")
        (pow(2, bits) - 1).toLong
    }
}