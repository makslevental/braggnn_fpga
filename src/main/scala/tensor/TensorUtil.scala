package tensor


import chisel3._
import chisel3.util._

/** TensorParams.
 *
 * This Bundle derives parameters for each tensorType, including inputs (inp),
 * weights (wgt), biases (acc), and outputs (out). This is used to avoid
 * doing the same boring calculations over and over again.
 */
class TensorParams(tensorType: String = "none", p: Parameters) extends Bundle {
    val errorMsg =
        s"\n\n[VTA] [TensorParams] only inp, wgt, acc, and out supported\n\n"

    require(tensorType == "inp" || tensorType == "wgt"
      || tensorType == "acc" || tensorType == "out",
        errorMsg)

    val (tensorLength, tensorWidth, tensorElemBits) =
        if (tensorType == "inp")
            (p(CoreKey).batch, p(CoreKey).blockIn, p(CoreKey).inpBits)
        else if (tensorType == "wgt")
            (p(CoreKey).blockOut, p(CoreKey).blockIn, p(CoreKey).wgtBits)
        else if (tensorType == "acc")
            (p(CoreKey).batch, p(CoreKey).blockOut, p(CoreKey).accBits)
        else
            (p(CoreKey).batch, p(CoreKey).blockOut, p(CoreKey).outBits)

    val memBlockBits = p(ShellKey).memParams.dataBits
    val numMemBlock = (tensorWidth * tensorElemBits) / memBlockBits

    val memDepth =
        if (tensorType == "inp")
            p(CoreKey).inpMemDepth
        else if (tensorType == "wgt")
            p(CoreKey).wgtMemDepth
        else if (tensorType == "acc")
            p(CoreKey).accMemDepth
        else
            p(CoreKey).outMemDepth

    val memAddrBits = log2Ceil(memDepth)
}

/** TensorMaster.
 *
 * This interface issue read and write tensor-requests to scratchpads. For example,
 * The TensorGemm unit uses this interface for managing the inputs (inp), weights (wgt),
 * biases (acc), and outputs (out).
 *
 */
class TensorMaster(tensorType: String = "none", p: Parameters) extends TensorParams(tensorType, p) {
    val rd = new Bundle {
        val idx = ValidIO(UInt(memAddrBits.W))
        val data = Flipped(
            ValidIO(Vec(tensorLength, Vec(tensorWidth, UInt(tensorElemBits.W)))))
    }
    val wr = ValidIO(new Bundle {
        val idx = UInt(memAddrBits.W)
        val data = Vec(tensorLength, Vec(tensorWidth, UInt(tensorElemBits.W)))
    })
    def tieoffRead() {
        rd.idx.valid := false.B
        rd.idx.bits := 0.U
    }
    def tieoffWrite() {
        wr.valid := false.B
        wr.bits.idx := 0.U
        wr.bits.data.foreach { b =>
            b.foreach { c =>
                c := 0.U
            }
        }
    }
    override def cloneType =
        new TensorMaster(tensorType, p).asInstanceOf[this.type]
}

/** TensorClient.
 *
 * This interface receives read and write tensor-requests to scratchpads. For example,
 * The TensorLoad unit uses this interface for receiving read and write requests from
 * the TensorGemm unit.
 */
class TensorClient(tensorType: String = "none", p: Parameters) extends TensorParams(tensorType, p) {
    val rd = new Bundle {
        val idx = Flipped(ValidIO(UInt(memAddrBits.W)))
        val data = ValidIO(
            Vec(tensorLength, Vec(tensorWidth, UInt(tensorElemBits.W))))
    }
    val wr = Flipped(ValidIO(new Bundle {
        val idx = UInt(memAddrBits.W)
        val data = Vec(tensorLength, Vec(tensorWidth, UInt(tensorElemBits.W)))
    }))
    def tieoffRead() {
        rd.data.valid := false.B
        rd.data.bits.foreach { b =>
            b.foreach { c =>
                c := 0.U
            }
        }
    }
    override def cloneType =
        new TensorClient(tensorType, p).asInstanceOf[this.type]
}

/** TensorMasterData.
 *
 * This interface is only used for datapath only purposes and the direction convention
 * is based on the TensorMaster interface, which means this is an input. This interface
 * is used on datapath only module such MatrixVectorCore or AluVector.
 */
class TensorMasterData(tensorType: String = "none", p: Parameters) extends TensorParams(tensorType, p) {
    val data = Flipped(
        ValidIO(Vec(tensorLength, Vec(tensorWidth, UInt(tensorElemBits.W)))))
    override def cloneType =
        new TensorMasterData(tensorType, p).asInstanceOf[this.type]
}

/** TensorClientData.
 *
 * This interface is only used for datapath only purposes and the direction convention
 * is based on the TensorClient interface, which means this is an output. This interface
 * is used on datapath only module such MatrixVectorCore or AluVector.
 */
class TensorClientData(tensorType: String = "none", p: Parameters) extends TensorParams(tensorType, p) {
    val data = ValidIO(
        Vec(tensorLength, Vec(tensorWidth, UInt(tensorElemBits.W))))
    override def cloneType =
        new TensorClientData(tensorType, p).asInstanceOf[this.type]
}



/** MemDecode.
 *
 * Decode memory instructions with a Bundle. This is similar to an union,
 * therefore order matters when declaring fields. These are the instructions
 * decoded with this bundle:
 *   - LUOP
 *   - LWGT
 *   - LINP
 *   - LACC
 *   - SOUT
 */
class MemDecode extends Bundle {
    val xpad_1 = UInt(M_PAD_BITS.W)
    val xpad_0 = UInt(M_PAD_BITS.W)
    val ypad_1 = UInt(M_PAD_BITS.W)
    val ypad_0 = UInt(M_PAD_BITS.W)
    val xstride: UInt = UInt(M_STRIDE_BITS.W)
    val xsize = UInt(M_SIZE_BITS.W)
    val ysize = UInt(M_SIZE_BITS.W)
    val empty_0 = UInt(6.W) // derive this
    val dram_offset = UInt(M_DRAM_OFFSET_BITS.W)
    val sram_offset = UInt(M_SRAM_OFFSET_BITS.W)
    val id = UInt(M_ID_BITS.W)
    val push_next = Bool()
    val push_prev = Bool()
    val pop_next = Bool()
    val pop_prev = Bool()
    val op = UInt(OP_BITS.W)
}

/** TensorPadCtrl. Zero-padding controller for TensorLoad. */
class TensorPadCtrl(padType: String = "none", sizeFactor: Int = 1) extends Module {
    val errorMsg =
        s"\n\n\n[VTA-ERROR] only YPad0, YPad1, XPad0, or XPad1 supported\n\n\n"
    require(padType == "YPad0" || padType == "YPad1"
      || padType == "XPad0" || padType == "XPad1",
        errorMsg)

    val io = IO(new Bundle {
        val start = Input(Bool())
        val done = Output(Bool())
        val inst = Input(UInt(INST_BITS.W))
    })

    val dec = io.inst.asTypeOf(new MemDecode)

    val xmax = Reg(chiselTypeOf(dec.xsize))
    val ymax = Reg(chiselTypeOf(dec.ypad_0))
    val xcnt = Reg(chiselTypeOf(dec.xsize))
    val ycnt = Reg(chiselTypeOf(dec.ypad_0))

    val xval =
        if (padType == "YPad0" || padType == "YPad1") {
            // TODO: is this going to screw me? the as UInt?
            ((dec.xpad_0 + dec.xsize + dec.xpad_1) << log2Ceil(sizeFactor)).asUInt() - 1.U
        } else if (padType == "XPad0")
            (dec.xpad_0 << log2Ceil(sizeFactor)).asUInt() - 1.U
        else
            (dec.xpad_1 << log2Ceil(sizeFactor)).asUInt() - 1.U

    val yval =
        if (padType == "YPad0")
            Mux(dec.ypad_0 =/= 0.U, dec.ypad_0 - 1.U, 0.U)
        else if (padType == "YPad1")
            Mux(dec.ypad_1 =/= 0.U, dec.ypad_1 - 1.U, 0.U)
        else
            0.U

    val sIdle :: sActive :: Nil = Enum(2)
    val state = RegInit(sIdle)

    switch(state) {
        is(sIdle) {
            when(io.start) {
                state := sActive
            }
        }
        is(sActive) {
            when(ycnt === ymax && xcnt === xmax) {
                state := sIdle
            }
        }
    }

    when(state === sIdle) {
        xmax := xval
        ymax := yval
    }

    when(state === sIdle || xcnt === xmax) {
        xcnt := 0.U
    }.elsewhen(state === sActive) {
        xcnt := xcnt + 1.U
    }

    when(state === sIdle || ymax === 0.U) {
        ycnt := 0.U
    }.elsewhen(state === sActive && xcnt === xmax) {
        ycnt := ycnt + 1.U
    }

    io.done := state === sActive & ycnt === ymax & xcnt === xmax
}

/** TensorDataCtrl. Data controller for TensorLoad. */
class TensorDataCtrl(tensorType: String = "none",
                     sizeFactor: Int = 1, strideFactor: Int = 1)(implicit p: Parameters) extends Module {
    val mp = p(ShellKey).memParams
    val io = IO(new Bundle {
        val start = Input(Bool())
        val done = Output(Bool())
        val inst = Input(UInt(INST_BITS.W))
        val baddr = Input(UInt(mp.addrBits.W))
        val xinit = Input(Bool())
        val xupdate = Input(Bool())
        val yupdate = Input(Bool())
        val stride = Output(Bool())
        val split = Output(Bool())
        val commit = Output(Bool())
        val addr = Output(UInt(mp.addrBits.W))
        val len = Output(UInt(mp.lenBits.W))
    })

    val dec = io.inst.asTypeOf(new MemDecode)

    val caddr = Reg(UInt(mp.addrBits.W))
    val baddr = Reg(UInt(mp.addrBits.W))
    val len = Reg(UInt(mp.lenBits.W))
    val maskOffset = VecInit(Seq.fill(M_DRAM_OFFSET_BITS)(true.B)).asUInt
    val elemBytes =
        if (tensorType == "inp") {
            (p(CoreKey).batch * p(CoreKey).blockIn * p(CoreKey).inpBits) / 8
        } else if (tensorType == "wgt") {
            (p(CoreKey).blockOut * p(CoreKey).blockIn * p(CoreKey).wgtBits) / 8
        } else {
            (p(CoreKey).batch * p(CoreKey).blockOut * p(CoreKey).accBits) / 8
        }

    val xmax_bytes = ((1 << mp.lenBits) * mp.dataBits / 8).U
    val xcnt = Reg(UInt(mp.lenBits.W))
    val xrem = Reg(chiselTypeOf(dec.xsize))
    val xsize = (dec.xsize << log2Ceil(sizeFactor)).asUInt() - 1.U
    val xmax = (1 << mp.lenBits).U
    val ycnt = Reg(chiselTypeOf(dec.ysize))

    val xfer_bytes = Reg(UInt(mp.addrBits.W))
    val pulse_bytes_bits = log2Ceil(mp.dataBits >> 3).asUInt()
    val xstride_bytes = (dec.xstride << log2Ceil(elemBytes)).asUInt()

    val xfer_init_addr = io.baddr | (maskOffset & (dec.dram_offset << log2Ceil(elemBytes)).asUInt())
    val xfer_split_addr = caddr + xfer_bytes
    val xfer_stride_addr = baddr + xstride_bytes

    val xfer_init_bytes   = xmax_bytes - xfer_init_addr % xmax_bytes
    val xfer_init_pulses  = (xfer_init_bytes >> pulse_bytes_bits).asUInt()
    val xfer_split_bytes  = xmax_bytes - xfer_split_addr % xmax_bytes
    val xfer_split_pulses = (xfer_split_bytes >> pulse_bytes_bits).asUInt()
    val xfer_stride_bytes = xmax_bytes - xfer_stride_addr % xmax_bytes
    val xfer_stride_pulses= (xfer_stride_bytes >> pulse_bytes_bits).asUInt()

    val stride = xcnt === len &
      xrem === 0.U &
      ycnt =/= dec.ysize - 1.U

    val split = xcnt === len & xrem =/= 0.U

    when(io.start) {
        xfer_bytes := xfer_init_bytes
        when(xsize < xfer_init_pulses) {
            len := xsize
            xrem := 0.U
        }.otherwise {
            len := xfer_init_pulses - 1.U
            xrem := xsize - xfer_init_pulses
        }
    }.elsewhen(io.xupdate && stride) {
        xfer_bytes := xfer_stride_bytes
        when(xsize < xfer_stride_pulses) {
            len := xsize
            xrem := 0.U
        }.otherwise {
            len := xfer_stride_pulses - 1.U
            xrem := xsize - xfer_stride_pulses
        }
    }.elsewhen(io.xupdate && split) {
        xfer_bytes := xfer_split_bytes
        when(xrem < xfer_split_pulses) {
            len := xrem
            xrem := 0.U
        }.otherwise {
            len := xfer_split_pulses - 1.U
            xrem := xrem - xfer_split_pulses
        }
    }

    when(io.xinit) {
        xcnt := 0.U
    }.elsewhen(io.xupdate) {
        xcnt := xcnt + 1.U
    }

    when(io.start) {
        ycnt := 0.U
    }.elsewhen(io.yupdate && stride) {
        ycnt := ycnt + 1.U
    }

    when(io.start) {
        caddr := xfer_init_addr
        baddr := xfer_init_addr
    }.elsewhen(io.yupdate) {
        when(split) {
            caddr := xfer_split_addr
        }.elsewhen(stride) {
            caddr := xfer_stride_addr
            baddr := xfer_stride_addr
        }
    }

    io.stride := stride
    io.split := split
    io.commit := xcnt === len
    io.addr := caddr
    io.len := len
    io.done := xcnt === len &
      xrem === 0.U &
      ycnt === dec.ysize - 1.U
}
