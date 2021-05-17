package matmul

import chisel3._
import chisel3.util.{isPow2, log2Ceil}


/** Pipelined DotProduct based on MAC and PipeAdder */
class DotProduct(bitWidth: Int = 8, size: Int = 16) extends Module {
    val errorMsg =
        s"\n\n[VTA] [DotProduct] size must be greater than 4 and a power of 2\n\n"
    require(size >= 2 && isPow2(size), errorMsg)

    val macs = Seq.fill(size)(Module(new MAC(bitWidth, cBits = 1))) // # of total vector pairs
    val summer = Module(new LogSum(macs.head.outBits + log2Ceil(size) + 1, size))
    val io = IO(new Bundle {
        val a = Input(Vec(size, SInt(bitWidth.W)))
        val b = Input(Vec(size, SInt(bitWidth.W)))
        val y = Output(SInt(summer.outBits.W))
    })
    // Vector MACs
    for (i <- 0 until size) {
        macs(i).io.a := io.a(i)
        macs(i).io.b := io.b(i)
        macs(i).io.c := 0.S

        summer.io.inVec(i) := macs(i).io.y
    }
    io.y := summer.io.y
}


class Matrix(rows: Int, cols: Int, bitWidth: Int) extends Bundle {
    val data: Vec[Vec[SInt]] = Vec(rows, Vec(cols, SInt(bitWidth.W)))
}

class Valid[+T <: Data](gen: T) extends Bundle {
    val valid: Bool = Output(Bool())
    val data: T = Output(gen)

    override def cloneType: this.type = Valid(gen).asInstanceOf[this.type]
}

object Valid {
    def apply[T <: Data](gen: T): Valid[T] = new Valid(gen)
}

class MatrixVectorProduct(rows: Int, cols: Int, bitWidth: Int) extends Module {
    val io = IO(new Bundle {
        val mat = Input(new Matrix(rows, cols, bitWidth))
        val vec = Input(Vec(cols, SInt(bitWidth.W)))
        val out = Output(Vec(rows, SInt(bitWidth.W)))
    })

    val dot = Seq.fill(rows)(
        Module(new DotProduct(bitWidth, cols)))

    for (i <- 0 until rows) {
        for (j <- 0 until cols) {
            dot(i).io.a(j) := io.mat.data(i)(j) // input vector
            dot(i).io.b(j) := io.vec(j)
        }
        io.out(i) := dot(i).io.y
    }
}


/** Perform (NXM)(MXR) -> (NXR) matrix-matrix-multiplication based on MatrixVectorProduct */
class MatrixMatrixProduct(N: Int, M: Int, R: Int, bitWidth: Int) extends Module {
    val io = IO(new Bundle {
        // out = A * B
        val A = Input(new Matrix(N, M, bitWidth))
        val B = Input(new Matrix(M, R, bitWidth))
        val out = Output(new Matrix(N, R, bitWidth))
    })

    var matVecMul = Seq.fill(R)(
        Module(new MatrixVectorProduct(N, M, bitWidth)))


    for (i <- 0 until R) {
        matVecMul(i).io.mat <> io.A
        for (j <- 0 until M) {
            matVecMul(i).io.vec(j) := io.B.data(j)(i)
        }
        for (j <- 0 until N) {
            io.out.data(j)(i) := matVecMul(i).io.out(j)
        }
    }
}


//
///** Perform matrix-vector-multiplication based on DotProduct */
//class MatrixVectorMultiplication(size: Int, bitWidth: Int) extends Module {
//    val io = IO(new Bundle {
//        var reset = Input(Bool()) // FIXME: reset should be replaced by a load-acc instr
//        val inp = Flipped(Valid(Vec(size, UInt(bitWidth.W))))
//        val wgt = Flipped(Valid(new Matrix(size, size, bitWidth)))
//        // TODO: i don't know what the point of accumulator here is?
//        // TODO: ohhhhhh it has something to do with multiple matmuls?
//        val acc_i = Flipped(Valid(Vec(size, UInt(bitWidth.W))))
//        val acc_o = Valid(Vec(size, UInt(bitWidth.W)))
//        val out = Valid(Vec(size, UInt(bitWidth.W)))
//    })
//
//    val dot = Seq.fill(size)(
//        Module(new DotProduct(aBits = bitWidth, bBits = bitWidth, size)))
//    // Latency is defined as two in the following, because there is one cycle in the MAC module,
//    // and another cycle in the pipelined adders as the first layer of the accumulator
//    // TODO: why do you need a Pipe?
//    val acc = Seq.fill(size)(Module(new Pipe(UInt(bitWidth.W), latency = 2)))
//    val add = Seq.fill(size)(Wire(SInt(bitWidth.W)))
//    val vld = Wire(Vec(size, Bool()))
//
//    for (i <- 0 until size) {
//        acc(i).io.enq.valid := io.inp.valid & io.wgt.data.valid & io.acc_i.valid & ~io.reset
//        // bits are actually entries i.e. row 0 entry i
//        // acc_i is a vec of vecs of tensorElemBits
//        acc(i).io.enq.bits := io.acc_i.data(i)
//        for (j <- 0 until size) {
//            dot(i).io.a(j) := io.inp.data(j).asSInt // input vector
//            dot(i).io.b(j) := io.wgt.data.data(i)(j).asSInt
//        }
//        add(i) := acc(i).io.deq.bits.asSInt + dot(i).io.y
//        io.acc_o.data(i) := Mux(io.reset, 0.U, add(i).asUInt)
//        io.out.data(i) := add(i).asUInt
//        vld(i) := acc(i).io.deq.valid
//    }
//    io.acc_o.valid := vld.asUInt.andR | io.reset
//    io.out.valid := vld.asUInt.andR
//}
