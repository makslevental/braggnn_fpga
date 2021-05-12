import chisel3._
import chisel3.util._

package object tensor {
    val INST_BITS = 128

    val OP_BITS = 3

    val M_DEP_BITS = 4
    val M_ID_BITS = 3
    val M_SRAM_OFFSET_BITS = 16
    val M_DRAM_OFFSET_BITS = 32
    val M_SIZE_BITS = 16
    val M_STRIDE_BITS = 16
    val M_PAD_BITS = 4

    val C_UOP_BGN_BITS = 13
    val C_UOP_END_BITS = 14
    val C_ITER_BITS = 14
    val C_AIDX_BITS = 11
    val C_IIDX_BITS = 11
    val C_WIDX_BITS = 10
    val C_ALU_DEC_BITS = 2
    val C_ALU_OP_BITS = 3
    val C_ALU_IMM_BITS = 16

    val Y = true.B
    val N = false.B

    val OP_L = 0.asUInt(OP_BITS.W)
    val OP_S = 1.asUInt(OP_BITS.W)
    val OP_G = 2.asUInt(OP_BITS.W)
    val OP_F = 3.asUInt(OP_BITS.W)
    val OP_A = 4.asUInt(OP_BITS.W)
    val OP_X = 5.asUInt(OP_BITS.W)

    val ALU_OP_NUM = 5
    val ALU_OP = Enum(ALU_OP_NUM)

    val M_ID_U = 0.asUInt(M_ID_BITS.W)
    val M_ID_W = 1.asUInt(M_ID_BITS.W)
    val M_ID_I = 2.asUInt(M_ID_BITS.W)
    val M_ID_A = 3.asUInt(M_ID_BITS.W)
    val M_ID_O = 4.asUInt(M_ID_BITS.W)

}
