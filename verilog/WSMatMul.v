module WSMatMul(
  input         clock,
  input         reset,
  input  [7:0]  io_A_0_0,
  input  [7:0]  io_A_0_1,
  input  [7:0]  io_A_0_2,
  input  [7:0]  io_A_0_3,
  input  [7:0]  io_A_1_0,
  input  [7:0]  io_A_1_1,
  input  [7:0]  io_A_1_2,
  input  [7:0]  io_A_1_3,
  input  [7:0]  io_A_2_0,
  input  [7:0]  io_A_2_1,
  input  [7:0]  io_A_2_2,
  input  [7:0]  io_A_2_3,
  input  [7:0]  io_A_3_0,
  input  [7:0]  io_A_3_1,
  input  [7:0]  io_A_3_2,
  input  [7:0]  io_A_3_3,
  input  [7:0]  io_B_0,
  input  [7:0]  io_B_1,
  input  [7:0]  io_B_2,
  input  [7:0]  io_B_3,
  output [15:0] io_out_0,
  output [15:0] io_out_1,
  output [15:0] io_out_2,
  output [15:0] io_out_3
);
  wire  WSProcElem_0_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_0_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_0_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_0_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_0_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_0_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_0_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_1_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_1_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_1_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_1_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_1_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_1_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_1_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_2_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_2_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_2_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_2_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_2_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_2_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_2_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_3_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_3_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_3_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_3_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_3_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_3_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_3_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_4_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_4_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_4_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_4_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_4_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_4_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_4_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_5_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_5_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_5_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_5_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_5_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_5_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_5_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_6_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_6_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_6_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_6_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_6_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_6_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_6_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_7_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_7_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_7_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_7_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_7_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_7_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_7_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_8_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_8_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_8_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_8_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_8_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_8_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_8_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_9_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_9_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_9_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_9_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_9_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_9_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_9_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_10_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_10_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_10_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_10_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_10_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_10_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_10_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_11_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_11_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_11_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_11_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_11_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_11_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_11_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_12_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_12_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_12_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_12_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_12_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_12_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_12_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_13_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_13_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_13_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_13_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_13_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_13_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_13_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_14_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_14_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_14_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_14_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_14_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_14_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_14_io_outV; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_15_clock; // @[WSMatMul.scala 15:27]
  wire  WSProcElem_15_reset; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_15_io_inW; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_15_io_inPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_15_io_inV; // @[WSMatMul.scala 15:27]
  wire [15:0] WSProcElem_15_io_outPartialSum; // @[WSMatMul.scala 15:27]
  wire [7:0] WSProcElem_15_io_outV; // @[WSMatMul.scala 15:27]
  wire [7:0] hWires_0_0 = WSProcElem_0_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_0_1 = WSProcElem_1_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_0_2 = WSProcElem_2_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_1_0 = WSProcElem_4_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_1_1 = WSProcElem_5_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_1_2 = WSProcElem_6_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_2_0 = WSProcElem_8_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_2_1 = WSProcElem_9_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_2_2 = WSProcElem_10_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_3_0 = WSProcElem_12_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_3_1 = WSProcElem_13_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  wire [7:0] hWires_3_2 = WSProcElem_14_io_outPartialSum[7:0]; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  WSProcElem WSProcElem ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_0_clock),
    .reset(WSProcElem_0_reset),
    .io_inW(WSProcElem_0_io_inW),
    .io_inPartialSum(WSProcElem_0_io_inPartialSum),
    .io_inV(WSProcElem_0_io_inV),
    .io_outPartialSum(WSProcElem_0_io_outPartialSum),
    .io_outV(WSProcElem_0_io_outV)
  );
  WSProcElem WSProcElem_1 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_1_clock),
    .reset(WSProcElem_1_reset),
    .io_inW(WSProcElem_1_io_inW),
    .io_inPartialSum(WSProcElem_1_io_inPartialSum),
    .io_inV(WSProcElem_1_io_inV),
    .io_outPartialSum(WSProcElem_1_io_outPartialSum),
    .io_outV(WSProcElem_1_io_outV)
  );
  WSProcElem WSProcElem_2 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_2_clock),
    .reset(WSProcElem_2_reset),
    .io_inW(WSProcElem_2_io_inW),
    .io_inPartialSum(WSProcElem_2_io_inPartialSum),
    .io_inV(WSProcElem_2_io_inV),
    .io_outPartialSum(WSProcElem_2_io_outPartialSum),
    .io_outV(WSProcElem_2_io_outV)
  );
  WSProcElem WSProcElem_3 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_3_clock),
    .reset(WSProcElem_3_reset),
    .io_inW(WSProcElem_3_io_inW),
    .io_inPartialSum(WSProcElem_3_io_inPartialSum),
    .io_inV(WSProcElem_3_io_inV),
    .io_outPartialSum(WSProcElem_3_io_outPartialSum),
    .io_outV(WSProcElem_3_io_outV)
  );
  WSProcElem WSProcElem_4 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_4_clock),
    .reset(WSProcElem_4_reset),
    .io_inW(WSProcElem_4_io_inW),
    .io_inPartialSum(WSProcElem_4_io_inPartialSum),
    .io_inV(WSProcElem_4_io_inV),
    .io_outPartialSum(WSProcElem_4_io_outPartialSum),
    .io_outV(WSProcElem_4_io_outV)
  );
  WSProcElem WSProcElem_5 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_5_clock),
    .reset(WSProcElem_5_reset),
    .io_inW(WSProcElem_5_io_inW),
    .io_inPartialSum(WSProcElem_5_io_inPartialSum),
    .io_inV(WSProcElem_5_io_inV),
    .io_outPartialSum(WSProcElem_5_io_outPartialSum),
    .io_outV(WSProcElem_5_io_outV)
  );
  WSProcElem WSProcElem_6 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_6_clock),
    .reset(WSProcElem_6_reset),
    .io_inW(WSProcElem_6_io_inW),
    .io_inPartialSum(WSProcElem_6_io_inPartialSum),
    .io_inV(WSProcElem_6_io_inV),
    .io_outPartialSum(WSProcElem_6_io_outPartialSum),
    .io_outV(WSProcElem_6_io_outV)
  );
  WSProcElem WSProcElem_7 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_7_clock),
    .reset(WSProcElem_7_reset),
    .io_inW(WSProcElem_7_io_inW),
    .io_inPartialSum(WSProcElem_7_io_inPartialSum),
    .io_inV(WSProcElem_7_io_inV),
    .io_outPartialSum(WSProcElem_7_io_outPartialSum),
    .io_outV(WSProcElem_7_io_outV)
  );
  WSProcElem WSProcElem_8 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_8_clock),
    .reset(WSProcElem_8_reset),
    .io_inW(WSProcElem_8_io_inW),
    .io_inPartialSum(WSProcElem_8_io_inPartialSum),
    .io_inV(WSProcElem_8_io_inV),
    .io_outPartialSum(WSProcElem_8_io_outPartialSum),
    .io_outV(WSProcElem_8_io_outV)
  );
  WSProcElem WSProcElem_9 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_9_clock),
    .reset(WSProcElem_9_reset),
    .io_inW(WSProcElem_9_io_inW),
    .io_inPartialSum(WSProcElem_9_io_inPartialSum),
    .io_inV(WSProcElem_9_io_inV),
    .io_outPartialSum(WSProcElem_9_io_outPartialSum),
    .io_outV(WSProcElem_9_io_outV)
  );
  WSProcElem WSProcElem_10 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_10_clock),
    .reset(WSProcElem_10_reset),
    .io_inW(WSProcElem_10_io_inW),
    .io_inPartialSum(WSProcElem_10_io_inPartialSum),
    .io_inV(WSProcElem_10_io_inV),
    .io_outPartialSum(WSProcElem_10_io_outPartialSum),
    .io_outV(WSProcElem_10_io_outV)
  );
  WSProcElem WSProcElem_11 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_11_clock),
    .reset(WSProcElem_11_reset),
    .io_inW(WSProcElem_11_io_inW),
    .io_inPartialSum(WSProcElem_11_io_inPartialSum),
    .io_inV(WSProcElem_11_io_inV),
    .io_outPartialSum(WSProcElem_11_io_outPartialSum),
    .io_outV(WSProcElem_11_io_outV)
  );
  WSProcElem WSProcElem_12 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_12_clock),
    .reset(WSProcElem_12_reset),
    .io_inW(WSProcElem_12_io_inW),
    .io_inPartialSum(WSProcElem_12_io_inPartialSum),
    .io_inV(WSProcElem_12_io_inV),
    .io_outPartialSum(WSProcElem_12_io_outPartialSum),
    .io_outV(WSProcElem_12_io_outV)
  );
  WSProcElem WSProcElem_13 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_13_clock),
    .reset(WSProcElem_13_reset),
    .io_inW(WSProcElem_13_io_inW),
    .io_inPartialSum(WSProcElem_13_io_inPartialSum),
    .io_inV(WSProcElem_13_io_inV),
    .io_outPartialSum(WSProcElem_13_io_outPartialSum),
    .io_outV(WSProcElem_13_io_outV)
  );
  WSProcElem WSProcElem_14 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_14_clock),
    .reset(WSProcElem_14_reset),
    .io_inW(WSProcElem_14_io_inW),
    .io_inPartialSum(WSProcElem_14_io_inPartialSum),
    .io_inV(WSProcElem_14_io_inV),
    .io_outPartialSum(WSProcElem_14_io_outPartialSum),
    .io_outV(WSProcElem_14_io_outV)
  );
  WSProcElem WSProcElem_15 ( // @[WSMatMul.scala 15:27]
    .clock(WSProcElem_15_clock),
    .reset(WSProcElem_15_reset),
    .io_inW(WSProcElem_15_io_inW),
    .io_inPartialSum(WSProcElem_15_io_inPartialSum),
    .io_inV(WSProcElem_15_io_inV),
    .io_outPartialSum(WSProcElem_15_io_outPartialSum),
    .io_outV(WSProcElem_15_io_outV)
  );
  assign io_out_0 = WSProcElem_3_io_outPartialSum; // @[WSMatMul.scala 45:17]
  assign io_out_1 = WSProcElem_7_io_outPartialSum; // @[WSMatMul.scala 45:17]
  assign io_out_2 = WSProcElem_11_io_outPartialSum; // @[WSMatMul.scala 45:17]
  assign io_out_3 = WSProcElem_15_io_outPartialSum; // @[WSMatMul.scala 45:17]
  assign WSProcElem_0_clock = clock;
  assign WSProcElem_0_reset = reset;
  assign WSProcElem_0_io_inW = io_A_0_0; // @[WSMatMul.scala 29:28]
  assign WSProcElem_0_io_inPartialSum = 16'h0; // @[WSMatMul.scala 32:51]
  assign WSProcElem_0_io_inV = io_B_0; // @[WSMatMul.scala 39:42]
  assign WSProcElem_1_clock = clock;
  assign WSProcElem_1_reset = reset;
  assign WSProcElem_1_io_inW = io_A_0_1; // @[WSMatMul.scala 29:28]
  assign WSProcElem_1_io_inPartialSum = {{8'd0}, hWires_0_0}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_1_io_inV = io_B_1; // @[WSMatMul.scala 39:42]
  assign WSProcElem_2_clock = clock;
  assign WSProcElem_2_reset = reset;
  assign WSProcElem_2_io_inW = io_A_0_2; // @[WSMatMul.scala 29:28]
  assign WSProcElem_2_io_inPartialSum = {{8'd0}, hWires_0_1}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_2_io_inV = io_B_2; // @[WSMatMul.scala 39:42]
  assign WSProcElem_3_clock = clock;
  assign WSProcElem_3_reset = reset;
  assign WSProcElem_3_io_inW = io_A_0_3; // @[WSMatMul.scala 29:28]
  assign WSProcElem_3_io_inPartialSum = {{8'd0}, hWires_0_2}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_3_io_inV = io_B_3; // @[WSMatMul.scala 39:42]
  assign WSProcElem_4_clock = clock;
  assign WSProcElem_4_reset = reset;
  assign WSProcElem_4_io_inW = io_A_1_0; // @[WSMatMul.scala 29:28]
  assign WSProcElem_4_io_inPartialSum = 16'h0; // @[WSMatMul.scala 32:51]
  assign WSProcElem_4_io_inV = WSProcElem_0_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_5_clock = clock;
  assign WSProcElem_5_reset = reset;
  assign WSProcElem_5_io_inW = io_A_1_1; // @[WSMatMul.scala 29:28]
  assign WSProcElem_5_io_inPartialSum = {{8'd0}, hWires_1_0}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_5_io_inV = WSProcElem_1_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_6_clock = clock;
  assign WSProcElem_6_reset = reset;
  assign WSProcElem_6_io_inW = io_A_1_2; // @[WSMatMul.scala 29:28]
  assign WSProcElem_6_io_inPartialSum = {{8'd0}, hWires_1_1}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_6_io_inV = WSProcElem_2_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_7_clock = clock;
  assign WSProcElem_7_reset = reset;
  assign WSProcElem_7_io_inW = io_A_1_3; // @[WSMatMul.scala 29:28]
  assign WSProcElem_7_io_inPartialSum = {{8'd0}, hWires_1_2}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_7_io_inV = WSProcElem_3_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_8_clock = clock;
  assign WSProcElem_8_reset = reset;
  assign WSProcElem_8_io_inW = io_A_2_0; // @[WSMatMul.scala 29:28]
  assign WSProcElem_8_io_inPartialSum = 16'h0; // @[WSMatMul.scala 32:51]
  assign WSProcElem_8_io_inV = WSProcElem_4_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_9_clock = clock;
  assign WSProcElem_9_reset = reset;
  assign WSProcElem_9_io_inW = io_A_2_1; // @[WSMatMul.scala 29:28]
  assign WSProcElem_9_io_inPartialSum = {{8'd0}, hWires_2_0}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_9_io_inV = WSProcElem_5_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_10_clock = clock;
  assign WSProcElem_10_reset = reset;
  assign WSProcElem_10_io_inW = io_A_2_2; // @[WSMatMul.scala 29:28]
  assign WSProcElem_10_io_inPartialSum = {{8'd0}, hWires_2_1}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_10_io_inV = WSProcElem_6_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_11_clock = clock;
  assign WSProcElem_11_reset = reset;
  assign WSProcElem_11_io_inW = io_A_2_3; // @[WSMatMul.scala 29:28]
  assign WSProcElem_11_io_inPartialSum = {{8'd0}, hWires_2_2}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_11_io_inV = WSProcElem_7_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_12_clock = clock;
  assign WSProcElem_12_reset = reset;
  assign WSProcElem_12_io_inW = io_A_3_0; // @[WSMatMul.scala 29:28]
  assign WSProcElem_12_io_inPartialSum = 16'h0; // @[WSMatMul.scala 32:51]
  assign WSProcElem_12_io_inV = WSProcElem_8_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_13_clock = clock;
  assign WSProcElem_13_reset = reset;
  assign WSProcElem_13_io_inW = io_A_3_1; // @[WSMatMul.scala 29:28]
  assign WSProcElem_13_io_inPartialSum = {{8'd0}, hWires_3_0}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_13_io_inV = WSProcElem_9_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_14_clock = clock;
  assign WSProcElem_14_reset = reset;
  assign WSProcElem_14_io_inW = io_A_3_2; // @[WSMatMul.scala 29:28]
  assign WSProcElem_14_io_inPartialSum = {{8'd0}, hWires_3_1}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_14_io_inV = WSProcElem_10_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
  assign WSProcElem_15_clock = clock;
  assign WSProcElem_15_reset = reset;
  assign WSProcElem_15_io_inW = io_A_3_3; // @[WSMatMul.scala 29:28]
  assign WSProcElem_15_io_inPartialSum = {{8'd0}, hWires_3_2}; // @[WSMatMul.scala 19:29 WSMatMul.scala 36:44]
  assign WSProcElem_15_io_inV = WSProcElem_11_io_outV; // @[WSMatMul.scala 23:25 WSMatMul.scala 43:44]
endmodule
