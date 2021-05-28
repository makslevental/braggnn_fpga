package blackbox

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util.HasBlackBoxInline

class BlackBoxRealAdd extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle() {
    val in1 = Input(UInt(64.W))
    val in2 = Input(UInt(64.W))
    val out = Output(UInt(64.W))
  })
  setInline(
    "BlackBoxRealAdd.v",
    """
      |module BlackBoxRealAdd(
      |    input  [15:0] in1,
      |    input  [15:0] in2,
      |    output [15:0] out
      |);
      |always @* begin
      |  out <= $realtobits($bitstoreal(in1) + $bitstoreal(in2));
      |end
      |endmodule
    """.stripMargin
  )
}

//object BlackBoxRealAdd extends App {
//  (new ChiselStage).emitVerilog(new BlackBoxRealAdd, args)
//}
