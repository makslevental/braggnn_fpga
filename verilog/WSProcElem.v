module WSProcElem(
  input         clock,
  input         reset,
  input  [15:0] io_inW,
  input  [31:0] io_inPartialSum,
  input  [15:0] io_inV,
  output [31:0] io_outPartialSum,
  output [15:0] io_outV
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] psReg; // @[WSProcElem.scala 16:22]
  reg [15:0] vReg; // @[WSProcElem.scala 17:21]
  wire [31:0] _psReg_T = io_inW * io_inV; // @[WSProcElem.scala 19:38]
  wire [31:0] _psReg_T_2 = io_inPartialSum + _psReg_T; // @[WSProcElem.scala 19:28]
  assign io_outPartialSum = psReg; // @[WSProcElem.scala 22:20]
  assign io_outV = vReg; // @[WSProcElem.scala 23:11]
  always @(posedge clock) begin
    if (reset) begin // @[WSProcElem.scala 16:22]
      psReg <= 32'h0; // @[WSProcElem.scala 16:22]
    end else begin
      psReg <= _psReg_T_2; // @[WSProcElem.scala 19:9]
    end
    if (reset) begin // @[WSProcElem.scala 17:21]
      vReg <= 16'h0; // @[WSProcElem.scala 17:21]
    end else begin
      vReg <= io_inV; // @[WSProcElem.scala 20:8]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  psReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  vReg = _RAND_1[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
