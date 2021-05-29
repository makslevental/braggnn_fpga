module OSProcElem(
  input         clock,
  input         reset,
  input  [15:0] io_inH,
  input  [15:0] io_inV,
  output [31:0] io_outH,
  output [31:0] io_outV,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] res; // @[OSProcElem.scala 15:21]
  reg [15:0] hreg; // @[OSProcElem.scala 16:21]
  reg [15:0] vreg; // @[OSProcElem.scala 17:21]
  wire [31:0] _res_T = io_inH * io_inV; // @[OSProcElem.scala 20:24]
  wire [31:0] _res_T_2 = res + _res_T; // @[OSProcElem.scala 20:14]
  assign io_outH = {{16'd0}, hreg}; // @[OSProcElem.scala 26:11]
  assign io_outV = {{16'd0}, vreg}; // @[OSProcElem.scala 27:11]
  assign io_out = res; // @[OSProcElem.scala 28:10]
  always @(posedge clock) begin
    if (reset) begin // @[OSProcElem.scala 15:21]
      res <= 32'h0; // @[OSProcElem.scala 15:21]
    end else begin
      res <= _res_T_2; // @[OSProcElem.scala 20:7]
    end
    if (reset) begin // @[OSProcElem.scala 16:21]
      hreg <= 16'h0; // @[OSProcElem.scala 16:21]
    end else begin
      hreg <= io_inH; // @[OSProcElem.scala 23:8]
    end
    if (reset) begin // @[OSProcElem.scala 17:21]
      vreg <= 16'h0; // @[OSProcElem.scala 17:21]
    end else begin
      vreg <= io_inV; // @[OSProcElem.scala 24:8]
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
  res = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  hreg = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  vreg = _RAND_2[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module OSMatMul(
  input         clock,
  input         reset,
  input  [15:0] io_A_0,
  input  [15:0] io_A_1,
  input  [15:0] io_A_2,
  input  [15:0] io_A_3,
  input  [15:0] io_B_0,
  input  [15:0] io_B_1,
  input  [15:0] io_B_2,
  input  [15:0] io_B_3,
  output [31:0] io_C_0_0,
  output [31:0] io_C_0_1,
  output [31:0] io_C_0_2,
  output [31:0] io_C_0_3,
  output [31:0] io_C_1_0,
  output [31:0] io_C_1_1,
  output [31:0] io_C_1_2,
  output [31:0] io_C_1_3,
  output [31:0] io_C_2_0,
  output [31:0] io_C_2_1,
  output [31:0] io_C_2_2,
  output [31:0] io_C_2_3,
  output [31:0] io_C_3_0,
  output [31:0] io_C_3_1,
  output [31:0] io_C_3_2,
  output [31:0] io_C_3_3
);
  wire  OSProcElem_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_1_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_1_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_1_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_1_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_1_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_1_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_1_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_2_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_2_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_2_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_2_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_2_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_2_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_2_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_3_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_3_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_3_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_3_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_3_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_3_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_3_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_4_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_4_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_4_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_4_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_4_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_4_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_4_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_5_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_5_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_5_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_5_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_5_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_5_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_5_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_6_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_6_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_6_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_6_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_6_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_6_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_6_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_7_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_7_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_7_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_7_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_7_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_7_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_7_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_8_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_8_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_8_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_8_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_8_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_8_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_8_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_9_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_9_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_9_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_9_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_9_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_9_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_9_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_10_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_10_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_10_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_10_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_10_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_10_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_10_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_11_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_11_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_11_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_11_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_11_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_11_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_11_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_12_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_12_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_12_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_12_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_12_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_12_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_12_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_13_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_13_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_13_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_13_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_13_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_13_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_13_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_14_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_14_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_14_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_14_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_14_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_14_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_14_io_out; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_15_clock; // @[OSMatMul.scala 15:27]
  wire  OSProcElem_15_reset; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_15_io_inH; // @[OSMatMul.scala 15:27]
  wire [15:0] OSProcElem_15_io_inV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_15_io_outH; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_15_io_outV; // @[OSMatMul.scala 15:27]
  wire [31:0] OSProcElem_15_io_out; // @[OSMatMul.scala 15:27]
  OSProcElem OSProcElem ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_clock),
    .reset(OSProcElem_reset),
    .io_inH(OSProcElem_io_inH),
    .io_inV(OSProcElem_io_inV),
    .io_outH(OSProcElem_io_outH),
    .io_outV(OSProcElem_io_outV),
    .io_out(OSProcElem_io_out)
  );
  OSProcElem OSProcElem_1 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_1_clock),
    .reset(OSProcElem_1_reset),
    .io_inH(OSProcElem_1_io_inH),
    .io_inV(OSProcElem_1_io_inV),
    .io_outH(OSProcElem_1_io_outH),
    .io_outV(OSProcElem_1_io_outV),
    .io_out(OSProcElem_1_io_out)
  );
  OSProcElem OSProcElem_2 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_2_clock),
    .reset(OSProcElem_2_reset),
    .io_inH(OSProcElem_2_io_inH),
    .io_inV(OSProcElem_2_io_inV),
    .io_outH(OSProcElem_2_io_outH),
    .io_outV(OSProcElem_2_io_outV),
    .io_out(OSProcElem_2_io_out)
  );
  OSProcElem OSProcElem_3 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_3_clock),
    .reset(OSProcElem_3_reset),
    .io_inH(OSProcElem_3_io_inH),
    .io_inV(OSProcElem_3_io_inV),
    .io_outH(OSProcElem_3_io_outH),
    .io_outV(OSProcElem_3_io_outV),
    .io_out(OSProcElem_3_io_out)
  );
  OSProcElem OSProcElem_4 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_4_clock),
    .reset(OSProcElem_4_reset),
    .io_inH(OSProcElem_4_io_inH),
    .io_inV(OSProcElem_4_io_inV),
    .io_outH(OSProcElem_4_io_outH),
    .io_outV(OSProcElem_4_io_outV),
    .io_out(OSProcElem_4_io_out)
  );
  OSProcElem OSProcElem_5 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_5_clock),
    .reset(OSProcElem_5_reset),
    .io_inH(OSProcElem_5_io_inH),
    .io_inV(OSProcElem_5_io_inV),
    .io_outH(OSProcElem_5_io_outH),
    .io_outV(OSProcElem_5_io_outV),
    .io_out(OSProcElem_5_io_out)
  );
  OSProcElem OSProcElem_6 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_6_clock),
    .reset(OSProcElem_6_reset),
    .io_inH(OSProcElem_6_io_inH),
    .io_inV(OSProcElem_6_io_inV),
    .io_outH(OSProcElem_6_io_outH),
    .io_outV(OSProcElem_6_io_outV),
    .io_out(OSProcElem_6_io_out)
  );
  OSProcElem OSProcElem_7 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_7_clock),
    .reset(OSProcElem_7_reset),
    .io_inH(OSProcElem_7_io_inH),
    .io_inV(OSProcElem_7_io_inV),
    .io_outH(OSProcElem_7_io_outH),
    .io_outV(OSProcElem_7_io_outV),
    .io_out(OSProcElem_7_io_out)
  );
  OSProcElem OSProcElem_8 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_8_clock),
    .reset(OSProcElem_8_reset),
    .io_inH(OSProcElem_8_io_inH),
    .io_inV(OSProcElem_8_io_inV),
    .io_outH(OSProcElem_8_io_outH),
    .io_outV(OSProcElem_8_io_outV),
    .io_out(OSProcElem_8_io_out)
  );
  OSProcElem OSProcElem_9 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_9_clock),
    .reset(OSProcElem_9_reset),
    .io_inH(OSProcElem_9_io_inH),
    .io_inV(OSProcElem_9_io_inV),
    .io_outH(OSProcElem_9_io_outH),
    .io_outV(OSProcElem_9_io_outV),
    .io_out(OSProcElem_9_io_out)
  );
  OSProcElem OSProcElem_10 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_10_clock),
    .reset(OSProcElem_10_reset),
    .io_inH(OSProcElem_10_io_inH),
    .io_inV(OSProcElem_10_io_inV),
    .io_outH(OSProcElem_10_io_outH),
    .io_outV(OSProcElem_10_io_outV),
    .io_out(OSProcElem_10_io_out)
  );
  OSProcElem OSProcElem_11 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_11_clock),
    .reset(OSProcElem_11_reset),
    .io_inH(OSProcElem_11_io_inH),
    .io_inV(OSProcElem_11_io_inV),
    .io_outH(OSProcElem_11_io_outH),
    .io_outV(OSProcElem_11_io_outV),
    .io_out(OSProcElem_11_io_out)
  );
  OSProcElem OSProcElem_12 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_12_clock),
    .reset(OSProcElem_12_reset),
    .io_inH(OSProcElem_12_io_inH),
    .io_inV(OSProcElem_12_io_inV),
    .io_outH(OSProcElem_12_io_outH),
    .io_outV(OSProcElem_12_io_outV),
    .io_out(OSProcElem_12_io_out)
  );
  OSProcElem OSProcElem_13 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_13_clock),
    .reset(OSProcElem_13_reset),
    .io_inH(OSProcElem_13_io_inH),
    .io_inV(OSProcElem_13_io_inV),
    .io_outH(OSProcElem_13_io_outH),
    .io_outV(OSProcElem_13_io_outV),
    .io_out(OSProcElem_13_io_out)
  );
  OSProcElem OSProcElem_14 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_14_clock),
    .reset(OSProcElem_14_reset),
    .io_inH(OSProcElem_14_io_inH),
    .io_inV(OSProcElem_14_io_inV),
    .io_outH(OSProcElem_14_io_outH),
    .io_outV(OSProcElem_14_io_outV),
    .io_out(OSProcElem_14_io_out)
  );
  OSProcElem OSProcElem_15 ( // @[OSMatMul.scala 15:27]
    .clock(OSProcElem_15_clock),
    .reset(OSProcElem_15_reset),
    .io_inH(OSProcElem_15_io_inH),
    .io_inV(OSProcElem_15_io_inV),
    .io_outH(OSProcElem_15_io_outH),
    .io_outV(OSProcElem_15_io_outV),
    .io_out(OSProcElem_15_io_out)
  );
  assign io_C_0_0 = OSProcElem_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_0_1 = OSProcElem_1_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_0_2 = OSProcElem_2_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_0_3 = OSProcElem_3_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_1_0 = OSProcElem_4_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_1_1 = OSProcElem_5_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_1_2 = OSProcElem_6_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_1_3 = OSProcElem_7_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_2_0 = OSProcElem_8_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_2_1 = OSProcElem_9_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_2_2 = OSProcElem_10_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_2_3 = OSProcElem_11_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_3_0 = OSProcElem_12_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_3_1 = OSProcElem_13_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_3_2 = OSProcElem_14_io_out; // @[OSMatMul.scala 44:22]
  assign io_C_3_3 = OSProcElem_15_io_out; // @[OSMatMul.scala 44:22]
  assign OSProcElem_clock = clock;
  assign OSProcElem_reset = reset;
  assign OSProcElem_io_inH = io_A_0; // @[OSMatMul.scala 31:42]
  assign OSProcElem_io_inV = io_B_0; // @[OSMatMul.scala 38:42]
  assign OSProcElem_1_clock = clock;
  assign OSProcElem_1_reset = reset;
  assign OSProcElem_1_io_inH = OSProcElem_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_1_io_inV = io_B_1; // @[OSMatMul.scala 38:42]
  assign OSProcElem_2_clock = clock;
  assign OSProcElem_2_reset = reset;
  assign OSProcElem_2_io_inH = OSProcElem_1_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_2_io_inV = io_B_2; // @[OSMatMul.scala 38:42]
  assign OSProcElem_3_clock = clock;
  assign OSProcElem_3_reset = reset;
  assign OSProcElem_3_io_inH = OSProcElem_2_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_3_io_inV = io_B_3; // @[OSMatMul.scala 38:42]
  assign OSProcElem_4_clock = clock;
  assign OSProcElem_4_reset = reset;
  assign OSProcElem_4_io_inH = io_A_1; // @[OSMatMul.scala 31:42]
  assign OSProcElem_4_io_inV = OSProcElem_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_5_clock = clock;
  assign OSProcElem_5_reset = reset;
  assign OSProcElem_5_io_inH = OSProcElem_4_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_5_io_inV = OSProcElem_1_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_6_clock = clock;
  assign OSProcElem_6_reset = reset;
  assign OSProcElem_6_io_inH = OSProcElem_5_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_6_io_inV = OSProcElem_2_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_7_clock = clock;
  assign OSProcElem_7_reset = reset;
  assign OSProcElem_7_io_inH = OSProcElem_6_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_7_io_inV = OSProcElem_3_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_8_clock = clock;
  assign OSProcElem_8_reset = reset;
  assign OSProcElem_8_io_inH = io_A_2; // @[OSMatMul.scala 31:42]
  assign OSProcElem_8_io_inV = OSProcElem_4_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_9_clock = clock;
  assign OSProcElem_9_reset = reset;
  assign OSProcElem_9_io_inH = OSProcElem_8_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_9_io_inV = OSProcElem_5_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_10_clock = clock;
  assign OSProcElem_10_reset = reset;
  assign OSProcElem_10_io_inH = OSProcElem_9_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_10_io_inV = OSProcElem_6_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_11_clock = clock;
  assign OSProcElem_11_reset = reset;
  assign OSProcElem_11_io_inH = OSProcElem_10_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_11_io_inV = OSProcElem_7_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_12_clock = clock;
  assign OSProcElem_12_reset = reset;
  assign OSProcElem_12_io_inH = io_A_3; // @[OSMatMul.scala 31:42]
  assign OSProcElem_12_io_inV = OSProcElem_8_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_13_clock = clock;
  assign OSProcElem_13_reset = reset;
  assign OSProcElem_13_io_inH = OSProcElem_12_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_13_io_inV = OSProcElem_9_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_14_clock = clock;
  assign OSProcElem_14_reset = reset;
  assign OSProcElem_14_io_inH = OSProcElem_13_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_14_io_inV = OSProcElem_10_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
  assign OSProcElem_15_clock = clock;
  assign OSProcElem_15_reset = reset;
  assign OSProcElem_15_io_inH = OSProcElem_14_io_outH[15:0]; // @[OSMatMul.scala 19:29 OSMatMul.scala 35:44]
  assign OSProcElem_15_io_inV = OSProcElem_11_io_outV[15:0]; // @[OSMatMul.scala 23:25 OSMatMul.scala 42:44]
endmodule
