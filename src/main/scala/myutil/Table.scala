package myutil

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util._
// import chisel3.experimental._

/**
  * Issue with generated tables
  */

class Table extends Module {
  val io = IO(new Bundle {
    val address = Input(UInt(10.W))
    val data = Output(UInt(8.W))
  })

  val table = VecInit[UInt](Table.genTable.map(_.asUInt))
  io.data := table(io.address)
}

class BBTable extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val address = Input(UInt(10.W))
    val data = Output(UInt(8.W))
  })

  var verilog =
    s"""
       module BBTable(
           input  [9:0] address,
           output [7:0] data
       );
       reg[7:0] out;
       always @* begin
         case(address)
      """

  val table = Table.genTable()
  for (i <- 0 until table.length) {
    verilog += i + ": out = " + table(i) + ";\n"
  }

  verilog +=
    """
             default: out = 0;
         endcase
       end

       assign data = out;
       endmodule
    """

  setInline("BlackBoxTable.v", verilog)

}

class TableTop(useBB: Boolean) extends Module {
  val io = IO(new Bundle {
    val address = Input(UInt(10.W))
    val data = Output(UInt(8.W))
  })

  // could be done nicer with hierarchy, but not so important here
  if (useBB) {
    val table = Module(new BBTable())
    table.io.address := RegNext(io.address)
    io.data := RegNext(table.io.data)
  } else {
    val table = Module(new Table())
    table.io.address := RegNext(io.address)
    io.data := RegNext(table.io.data)
  }

}


object Table {
  def main(args: Array[String]): Unit = {
//    chisel3.Driver.execute(Array("--target-dir", "generated"), () => new TableTop(args.length > 0))
    (new ChiselStage).emitVerilog(new TableTop(false), args)
  }

  def genTable() = {
    val arr = new Array[Int](16)
    val rnd = new scala.util.Random()
    for (i <- 0 until arr.length) {
      arr(i) = rnd.nextInt(256)
    }
    arr
  }
}