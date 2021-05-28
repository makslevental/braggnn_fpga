module ComplexMult(
  input  [63:0] io_a_real,
  input  [63:0] io_a_imag,
  input  [63:0] io_b_real,
  input  [63:0] io_b_imag,
  output [63:0] io_c_real,
  output [63:0] io_c_imag
);
  wire [127:0] ac = $signed(io_a_real) * $signed(io_b_real); // @[ComplexMatrix.scala 38:14]
  wire [127:0] bd = $signed(io_a_imag) * $signed(io_b_imag); // @[ComplexMatrix.scala 38:30]
  wire [127:0] ad = $signed(io_a_real) * $signed(io_b_imag); // @[ComplexMatrix.scala 38:46]
  wire [127:0] bc = $signed(io_a_imag) * $signed(io_b_real); // @[ComplexMatrix.scala 38:62]
  wire [127:0] _io_c_real_T_2 = $signed(ac) - $signed(bd); // @[ComplexMatrix.scala 39:19]
  wire [127:0] _io_c_imag_T_2 = $signed(ad) + $signed(bc); // @[ComplexMatrix.scala 40:19]
  wire [123:0] _GEN_0 = _io_c_real_T_2[127:4]; // @[ComplexMatrix.scala 39:13]
  wire [123:0] _GEN_2 = _io_c_imag_T_2[127:4]; // @[ComplexMatrix.scala 40:13]
  assign io_c_real = _GEN_0[63:0]; // @[ComplexMatrix.scala 39:13]
  assign io_c_imag = _GEN_2[63:0]; // @[ComplexMatrix.scala 40:13]
endmodule
module ComplexAdd(
  input  [64:0] io_b_real,
  input  [64:0] io_b_imag,
  output [64:0] io_c_real,
  output [64:0] io_c_imag
);
  wire [65:0] _io_c_real_T = {{1{io_b_real[64]}},io_b_real}; // @[ComplexMatrix.scala 22:26]
  wire [65:0] _io_c_imag_T = {{1{io_b_imag[64]}},io_b_imag}; // @[ComplexMatrix.scala 23:26]
  assign io_c_real = _io_c_real_T[64:0]; // @[ComplexMatrix.scala 22:26]
  assign io_c_imag = _io_c_imag_T[64:0]; // @[ComplexMatrix.scala 23:26]
endmodule
module CMAC(
  input         clock,
  input  [31:0] io_a_real,
  input  [31:0] io_a_imag,
  input  [31:0] io_b_real,
  input  [31:0] io_b_imag,
  output [64:0] io_y_real,
  output [64:0] io_y_imag
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] mult_io_a_real; // @[ComplexMatrix.scala 119:20]
  wire [63:0] mult_io_a_imag; // @[ComplexMatrix.scala 119:20]
  wire [63:0] mult_io_b_real; // @[ComplexMatrix.scala 119:20]
  wire [63:0] mult_io_b_imag; // @[ComplexMatrix.scala 119:20]
  wire [63:0] mult_io_c_real; // @[ComplexMatrix.scala 119:20]
  wire [63:0] mult_io_c_imag; // @[ComplexMatrix.scala 119:20]
  wire [64:0] add_io_b_real; // @[ComplexMatrix.scala 120:19]
  wire [64:0] add_io_b_imag; // @[ComplexMatrix.scala 120:19]
  wire [64:0] add_io_c_real; // @[ComplexMatrix.scala 120:19]
  wire [64:0] add_io_c_imag; // @[ComplexMatrix.scala 120:19]
  reg [31:0] rA_real; // @[ComplexMatrix.scala 122:19]
  reg [31:0] rA_imag; // @[ComplexMatrix.scala 122:19]
  reg [31:0] rB_real; // @[ComplexMatrix.scala 123:19]
  reg [31:0] rB_imag; // @[ComplexMatrix.scala 123:19]
  ComplexMult mult ( // @[ComplexMatrix.scala 119:20]
    .io_a_real(mult_io_a_real),
    .io_a_imag(mult_io_a_imag),
    .io_b_real(mult_io_b_real),
    .io_b_imag(mult_io_b_imag),
    .io_c_real(mult_io_c_real),
    .io_c_imag(mult_io_c_imag)
  );
  ComplexAdd add ( // @[ComplexMatrix.scala 120:19]
    .io_b_real(add_io_b_real),
    .io_b_imag(add_io_b_imag),
    .io_c_real(add_io_c_real),
    .io_c_imag(add_io_c_imag)
  );
  assign io_y_real = add_io_c_real; // @[ComplexMatrix.scala 132:8]
  assign io_y_imag = add_io_c_imag; // @[ComplexMatrix.scala 132:8]
  assign mult_io_a_real = {{32{rA_real[31]}},rA_real}; // @[ComplexMatrix.scala 126:13]
  assign mult_io_a_imag = {{32{rA_imag[31]}},rA_imag}; // @[ComplexMatrix.scala 126:13]
  assign mult_io_b_real = {{32{rB_real[31]}},rB_real}; // @[ComplexMatrix.scala 127:13]
  assign mult_io_b_imag = {{32{rB_imag[31]}},rB_imag}; // @[ComplexMatrix.scala 127:13]
  assign add_io_b_real = {{1{mult_io_c_real[63]}},mult_io_c_real}; // @[ComplexMatrix.scala 130:12]
  assign add_io_b_imag = {{1{mult_io_c_imag[63]}},mult_io_c_imag}; // @[ComplexMatrix.scala 130:12]
  always @(posedge clock) begin
    rA_real <= io_a_real; // @[ComplexMatrix.scala 122:19]
    rA_imag <= io_a_imag; // @[ComplexMatrix.scala 122:19]
    rB_real <= io_b_real; // @[ComplexMatrix.scala 123:19]
    rB_imag <= io_b_imag; // @[ComplexMatrix.scala 123:19]
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
  rA_real = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  rA_imag = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  rB_real = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  rB_imag = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ComplexAdd_4(
  input  [130:0] io_a_real,
  input  [130:0] io_a_imag,
  input  [130:0] io_b_real,
  input  [130:0] io_b_imag,
  output [130:0] io_c_real,
  output [130:0] io_c_imag
);
  assign io_c_real = $signed(io_a_real) + $signed(io_b_real); // @[ComplexMatrix.scala 22:26]
  assign io_c_imag = $signed(io_a_imag) + $signed(io_b_imag); // @[ComplexMatrix.scala 23:26]
endmodule
module ComplexAdd_6(
  input  [131:0] io_a_real,
  input  [131:0] io_a_imag,
  input  [131:0] io_b_real,
  input  [131:0] io_b_imag,
  output [131:0] io_c_real,
  output [131:0] io_c_imag
);
  assign io_c_real = $signed(io_a_real) + $signed(io_b_real); // @[ComplexMatrix.scala 22:26]
  assign io_c_imag = $signed(io_a_imag) + $signed(io_b_imag); // @[ComplexMatrix.scala 23:26]
endmodule
module ComplexLogSum(
  input  [64:0]  io_inVec_0_real,
  input  [64:0]  io_inVec_0_imag,
  input  [64:0]  io_inVec_1_real,
  input  [64:0]  io_inVec_1_imag,
  input  [64:0]  io_inVec_2_real,
  input  [64:0]  io_inVec_2_imag,
  input  [64:0]  io_inVec_3_real,
  input  [64:0]  io_inVec_3_imag,
  output [132:0] io_y_real,
  output [132:0] io_y_imag
);
  wire [130:0] ComplexAdd_io_a_real; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_io_a_imag; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_io_b_real; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_io_b_imag; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_io_c_real; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_io_c_imag; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_1_io_a_real; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_1_io_a_imag; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_1_io_b_real; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_1_io_b_imag; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_1_io_c_real; // @[ComplexMatrix.scala 59:20]
  wire [130:0] ComplexAdd_1_io_c_imag; // @[ComplexMatrix.scala 59:20]
  wire [131:0] ComplexAdd_2_io_a_real; // @[ComplexMatrix.scala 61:21]
  wire [131:0] ComplexAdd_2_io_a_imag; // @[ComplexMatrix.scala 61:21]
  wire [131:0] ComplexAdd_2_io_b_real; // @[ComplexMatrix.scala 61:21]
  wire [131:0] ComplexAdd_2_io_b_imag; // @[ComplexMatrix.scala 61:21]
  wire [131:0] ComplexAdd_2_io_c_real; // @[ComplexMatrix.scala 61:21]
  wire [131:0] ComplexAdd_2_io_c_imag; // @[ComplexMatrix.scala 61:21]
  ComplexAdd_4 ComplexAdd ( // @[ComplexMatrix.scala 59:20]
    .io_a_real(ComplexAdd_io_a_real),
    .io_a_imag(ComplexAdd_io_a_imag),
    .io_b_real(ComplexAdd_io_b_real),
    .io_b_imag(ComplexAdd_io_b_imag),
    .io_c_real(ComplexAdd_io_c_real),
    .io_c_imag(ComplexAdd_io_c_imag)
  );
  ComplexAdd_4 ComplexAdd_1 ( // @[ComplexMatrix.scala 59:20]
    .io_a_real(ComplexAdd_1_io_a_real),
    .io_a_imag(ComplexAdd_1_io_a_imag),
    .io_b_real(ComplexAdd_1_io_b_real),
    .io_b_imag(ComplexAdd_1_io_b_imag),
    .io_c_real(ComplexAdd_1_io_c_real),
    .io_c_imag(ComplexAdd_1_io_c_imag)
  );
  ComplexAdd_6 ComplexAdd_2 ( // @[ComplexMatrix.scala 61:21]
    .io_a_real(ComplexAdd_2_io_a_real),
    .io_a_imag(ComplexAdd_2_io_a_imag),
    .io_b_real(ComplexAdd_2_io_b_real),
    .io_b_imag(ComplexAdd_2_io_b_imag),
    .io_c_real(ComplexAdd_2_io_c_real),
    .io_c_imag(ComplexAdd_2_io_c_imag)
  );
  assign io_y_real = {{1{ComplexAdd_2_io_c_real[131]}},ComplexAdd_2_io_c_real}; // @[ComplexMatrix.scala 105:12]
  assign io_y_imag = {{1{ComplexAdd_2_io_c_imag[131]}},ComplexAdd_2_io_c_imag}; // @[ComplexMatrix.scala 105:12]
  assign ComplexAdd_io_a_real = {{66{io_inVec_0_real[64]}},io_inVec_0_real}; // @[ComplexMatrix.scala 72:26]
  assign ComplexAdd_io_a_imag = {{66{io_inVec_0_imag[64]}},io_inVec_0_imag}; // @[ComplexMatrix.scala 72:26]
  assign ComplexAdd_io_b_real = {{66{io_inVec_1_real[64]}},io_inVec_1_real}; // @[ComplexMatrix.scala 73:26]
  assign ComplexAdd_io_b_imag = {{66{io_inVec_1_imag[64]}},io_inVec_1_imag}; // @[ComplexMatrix.scala 73:26]
  assign ComplexAdd_1_io_a_real = {{66{io_inVec_2_real[64]}},io_inVec_2_real}; // @[ComplexMatrix.scala 72:26]
  assign ComplexAdd_1_io_a_imag = {{66{io_inVec_2_imag[64]}},io_inVec_2_imag}; // @[ComplexMatrix.scala 72:26]
  assign ComplexAdd_1_io_b_real = {{66{io_inVec_3_real[64]}},io_inVec_3_real}; // @[ComplexMatrix.scala 73:26]
  assign ComplexAdd_1_io_b_imag = {{66{io_inVec_3_imag[64]}},io_inVec_3_imag}; // @[ComplexMatrix.scala 73:26]
  assign ComplexAdd_2_io_a_real = {{1{ComplexAdd_io_c_real[130]}},ComplexAdd_io_c_real}; // @[ComplexMatrix.scala 79:30]
  assign ComplexAdd_2_io_a_imag = {{1{ComplexAdd_io_c_imag[130]}},ComplexAdd_io_c_imag}; // @[ComplexMatrix.scala 79:30]
  assign ComplexAdd_2_io_b_real = {{1{ComplexAdd_1_io_c_real[130]}},ComplexAdd_1_io_c_real}; // @[ComplexMatrix.scala 80:30]
  assign ComplexAdd_2_io_b_imag = {{1{ComplexAdd_1_io_c_imag[130]}},ComplexAdd_1_io_c_imag}; // @[ComplexMatrix.scala 80:30]
endmodule
module ComplexDotProduct(
  input          clock,
  input  [31:0]  io_a_0_real,
  input  [31:0]  io_a_0_imag,
  input  [31:0]  io_a_1_real,
  input  [31:0]  io_a_1_imag,
  input  [31:0]  io_a_2_real,
  input  [31:0]  io_a_2_imag,
  input  [31:0]  io_a_3_real,
  input  [31:0]  io_a_3_imag,
  input  [31:0]  io_b_0_real,
  input  [31:0]  io_b_0_imag,
  input  [31:0]  io_b_1_real,
  input  [31:0]  io_b_1_imag,
  input  [31:0]  io_b_2_real,
  input  [31:0]  io_b_2_imag,
  input  [31:0]  io_b_3_real,
  input  [31:0]  io_b_3_imag,
  output [132:0] io_y_real,
  output [132:0] io_y_imag
);
  wire  macs_0_clock; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_0_io_a_real; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_0_io_a_imag; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_0_io_b_real; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_0_io_b_imag; // @[ComplexMatrix.scala 140:35]
  wire [64:0] macs_0_io_y_real; // @[ComplexMatrix.scala 140:35]
  wire [64:0] macs_0_io_y_imag; // @[ComplexMatrix.scala 140:35]
  wire  macs_1_clock; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_1_io_a_real; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_1_io_a_imag; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_1_io_b_real; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_1_io_b_imag; // @[ComplexMatrix.scala 140:35]
  wire [64:0] macs_1_io_y_real; // @[ComplexMatrix.scala 140:35]
  wire [64:0] macs_1_io_y_imag; // @[ComplexMatrix.scala 140:35]
  wire  macs_2_clock; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_2_io_a_real; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_2_io_a_imag; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_2_io_b_real; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_2_io_b_imag; // @[ComplexMatrix.scala 140:35]
  wire [64:0] macs_2_io_y_real; // @[ComplexMatrix.scala 140:35]
  wire [64:0] macs_2_io_y_imag; // @[ComplexMatrix.scala 140:35]
  wire  macs_3_clock; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_3_io_a_real; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_3_io_a_imag; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_3_io_b_real; // @[ComplexMatrix.scala 140:35]
  wire [31:0] macs_3_io_b_imag; // @[ComplexMatrix.scala 140:35]
  wire [64:0] macs_3_io_y_real; // @[ComplexMatrix.scala 140:35]
  wire [64:0] macs_3_io_y_imag; // @[ComplexMatrix.scala 140:35]
  wire [64:0] summer_io_inVec_0_real; // @[ComplexMatrix.scala 141:22]
  wire [64:0] summer_io_inVec_0_imag; // @[ComplexMatrix.scala 141:22]
  wire [64:0] summer_io_inVec_1_real; // @[ComplexMatrix.scala 141:22]
  wire [64:0] summer_io_inVec_1_imag; // @[ComplexMatrix.scala 141:22]
  wire [64:0] summer_io_inVec_2_real; // @[ComplexMatrix.scala 141:22]
  wire [64:0] summer_io_inVec_2_imag; // @[ComplexMatrix.scala 141:22]
  wire [64:0] summer_io_inVec_3_real; // @[ComplexMatrix.scala 141:22]
  wire [64:0] summer_io_inVec_3_imag; // @[ComplexMatrix.scala 141:22]
  wire [132:0] summer_io_y_real; // @[ComplexMatrix.scala 141:22]
  wire [132:0] summer_io_y_imag; // @[ComplexMatrix.scala 141:22]
  CMAC macs_0 ( // @[ComplexMatrix.scala 140:35]
    .clock(macs_0_clock),
    .io_a_real(macs_0_io_a_real),
    .io_a_imag(macs_0_io_a_imag),
    .io_b_real(macs_0_io_b_real),
    .io_b_imag(macs_0_io_b_imag),
    .io_y_real(macs_0_io_y_real),
    .io_y_imag(macs_0_io_y_imag)
  );
  CMAC macs_1 ( // @[ComplexMatrix.scala 140:35]
    .clock(macs_1_clock),
    .io_a_real(macs_1_io_a_real),
    .io_a_imag(macs_1_io_a_imag),
    .io_b_real(macs_1_io_b_real),
    .io_b_imag(macs_1_io_b_imag),
    .io_y_real(macs_1_io_y_real),
    .io_y_imag(macs_1_io_y_imag)
  );
  CMAC macs_2 ( // @[ComplexMatrix.scala 140:35]
    .clock(macs_2_clock),
    .io_a_real(macs_2_io_a_real),
    .io_a_imag(macs_2_io_a_imag),
    .io_b_real(macs_2_io_b_real),
    .io_b_imag(macs_2_io_b_imag),
    .io_y_real(macs_2_io_y_real),
    .io_y_imag(macs_2_io_y_imag)
  );
  CMAC macs_3 ( // @[ComplexMatrix.scala 140:35]
    .clock(macs_3_clock),
    .io_a_real(macs_3_io_a_real),
    .io_a_imag(macs_3_io_a_imag),
    .io_b_real(macs_3_io_b_real),
    .io_b_imag(macs_3_io_b_imag),
    .io_y_real(macs_3_io_y_real),
    .io_y_imag(macs_3_io_y_imag)
  );
  ComplexLogSum summer ( // @[ComplexMatrix.scala 141:22]
    .io_inVec_0_real(summer_io_inVec_0_real),
    .io_inVec_0_imag(summer_io_inVec_0_imag),
    .io_inVec_1_real(summer_io_inVec_1_real),
    .io_inVec_1_imag(summer_io_inVec_1_imag),
    .io_inVec_2_real(summer_io_inVec_2_real),
    .io_inVec_2_imag(summer_io_inVec_2_imag),
    .io_inVec_3_real(summer_io_inVec_3_real),
    .io_inVec_3_imag(summer_io_inVec_3_imag),
    .io_y_real(summer_io_y_real),
    .io_y_imag(summer_io_y_imag)
  );
  assign io_y_real = summer_io_y_real; // @[ComplexMatrix.scala 156:8]
  assign io_y_imag = summer_io_y_imag; // @[ComplexMatrix.scala 156:8]
  assign macs_0_clock = clock;
  assign macs_0_io_a_real = io_a_0_real; // @[ComplexMatrix.scala 150:18]
  assign macs_0_io_a_imag = io_a_0_imag; // @[ComplexMatrix.scala 150:18]
  assign macs_0_io_b_real = io_b_0_real; // @[ComplexMatrix.scala 151:18]
  assign macs_0_io_b_imag = io_b_0_imag; // @[ComplexMatrix.scala 151:18]
  assign macs_1_clock = clock;
  assign macs_1_io_a_real = io_a_1_real; // @[ComplexMatrix.scala 150:18]
  assign macs_1_io_a_imag = io_a_1_imag; // @[ComplexMatrix.scala 150:18]
  assign macs_1_io_b_real = io_b_1_real; // @[ComplexMatrix.scala 151:18]
  assign macs_1_io_b_imag = io_b_1_imag; // @[ComplexMatrix.scala 151:18]
  assign macs_2_clock = clock;
  assign macs_2_io_a_real = io_a_2_real; // @[ComplexMatrix.scala 150:18]
  assign macs_2_io_a_imag = io_a_2_imag; // @[ComplexMatrix.scala 150:18]
  assign macs_2_io_b_real = io_b_2_real; // @[ComplexMatrix.scala 151:18]
  assign macs_2_io_b_imag = io_b_2_imag; // @[ComplexMatrix.scala 151:18]
  assign macs_3_clock = clock;
  assign macs_3_io_a_real = io_a_3_real; // @[ComplexMatrix.scala 150:18]
  assign macs_3_io_a_imag = io_a_3_imag; // @[ComplexMatrix.scala 150:18]
  assign macs_3_io_b_real = io_b_3_real; // @[ComplexMatrix.scala 151:18]
  assign macs_3_io_b_imag = io_b_3_imag; // @[ComplexMatrix.scala 151:18]
  assign summer_io_inVec_0_real = macs_0_io_y_real; // @[ComplexMatrix.scala 154:24]
  assign summer_io_inVec_0_imag = macs_0_io_y_imag; // @[ComplexMatrix.scala 154:24]
  assign summer_io_inVec_1_real = macs_1_io_y_real; // @[ComplexMatrix.scala 154:24]
  assign summer_io_inVec_1_imag = macs_1_io_y_imag; // @[ComplexMatrix.scala 154:24]
  assign summer_io_inVec_2_real = macs_2_io_y_real; // @[ComplexMatrix.scala 154:24]
  assign summer_io_inVec_2_imag = macs_2_io_y_imag; // @[ComplexMatrix.scala 154:24]
  assign summer_io_inVec_3_real = macs_3_io_y_real; // @[ComplexMatrix.scala 154:24]
  assign summer_io_inVec_3_imag = macs_3_io_y_imag; // @[ComplexMatrix.scala 154:24]
endmodule
module ComplexMatrixVectorProduct(
  input         clock,
  input  [31:0] io_mat_data_0_0_real,
  input  [31:0] io_mat_data_0_0_imag,
  input  [31:0] io_mat_data_0_1_real,
  input  [31:0] io_mat_data_0_1_imag,
  input  [31:0] io_mat_data_0_2_real,
  input  [31:0] io_mat_data_0_2_imag,
  input  [31:0] io_mat_data_0_3_real,
  input  [31:0] io_mat_data_0_3_imag,
  input  [31:0] io_mat_data_1_0_real,
  input  [31:0] io_mat_data_1_0_imag,
  input  [31:0] io_mat_data_1_1_real,
  input  [31:0] io_mat_data_1_1_imag,
  input  [31:0] io_mat_data_1_2_real,
  input  [31:0] io_mat_data_1_2_imag,
  input  [31:0] io_mat_data_1_3_real,
  input  [31:0] io_mat_data_1_3_imag,
  input  [31:0] io_mat_data_2_0_real,
  input  [31:0] io_mat_data_2_0_imag,
  input  [31:0] io_mat_data_2_1_real,
  input  [31:0] io_mat_data_2_1_imag,
  input  [31:0] io_mat_data_2_2_real,
  input  [31:0] io_mat_data_2_2_imag,
  input  [31:0] io_mat_data_2_3_real,
  input  [31:0] io_mat_data_2_3_imag,
  input  [31:0] io_mat_data_3_0_real,
  input  [31:0] io_mat_data_3_0_imag,
  input  [31:0] io_mat_data_3_1_real,
  input  [31:0] io_mat_data_3_1_imag,
  input  [31:0] io_mat_data_3_2_real,
  input  [31:0] io_mat_data_3_2_imag,
  input  [31:0] io_mat_data_3_3_real,
  input  [31:0] io_mat_data_3_3_imag,
  input  [31:0] io_vec_0_real,
  input  [31:0] io_vec_0_imag,
  input  [31:0] io_vec_1_real,
  input  [31:0] io_vec_1_imag,
  input  [31:0] io_vec_2_real,
  input  [31:0] io_vec_2_imag,
  input  [31:0] io_vec_3_real,
  input  [31:0] io_vec_3_imag,
  output [31:0] io_out_0_real,
  output [31:0] io_out_0_imag,
  output [31:0] io_out_1_real,
  output [31:0] io_out_1_imag,
  output [31:0] io_out_2_real,
  output [31:0] io_out_2_imag,
  output [31:0] io_out_3_real,
  output [31:0] io_out_3_imag
);
  wire  dot_0_clock; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_a_0_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_a_0_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_a_1_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_a_1_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_a_2_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_a_2_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_a_3_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_a_3_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_b_0_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_b_0_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_b_1_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_b_1_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_b_2_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_b_2_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_b_3_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_0_io_b_3_imag; // @[ComplexMatrix.scala 170:34]
  wire [132:0] dot_0_io_y_real; // @[ComplexMatrix.scala 170:34]
  wire [132:0] dot_0_io_y_imag; // @[ComplexMatrix.scala 170:34]
  wire  dot_1_clock; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_a_0_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_a_0_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_a_1_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_a_1_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_a_2_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_a_2_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_a_3_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_a_3_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_b_0_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_b_0_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_b_1_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_b_1_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_b_2_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_b_2_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_b_3_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_1_io_b_3_imag; // @[ComplexMatrix.scala 170:34]
  wire [132:0] dot_1_io_y_real; // @[ComplexMatrix.scala 170:34]
  wire [132:0] dot_1_io_y_imag; // @[ComplexMatrix.scala 170:34]
  wire  dot_2_clock; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_a_0_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_a_0_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_a_1_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_a_1_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_a_2_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_a_2_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_a_3_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_a_3_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_b_0_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_b_0_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_b_1_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_b_1_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_b_2_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_b_2_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_b_3_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_2_io_b_3_imag; // @[ComplexMatrix.scala 170:34]
  wire [132:0] dot_2_io_y_real; // @[ComplexMatrix.scala 170:34]
  wire [132:0] dot_2_io_y_imag; // @[ComplexMatrix.scala 170:34]
  wire  dot_3_clock; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_a_0_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_a_0_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_a_1_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_a_1_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_a_2_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_a_2_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_a_3_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_a_3_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_b_0_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_b_0_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_b_1_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_b_1_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_b_2_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_b_2_imag; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_b_3_real; // @[ComplexMatrix.scala 170:34]
  wire [31:0] dot_3_io_b_3_imag; // @[ComplexMatrix.scala 170:34]
  wire [132:0] dot_3_io_y_real; // @[ComplexMatrix.scala 170:34]
  wire [132:0] dot_3_io_y_imag; // @[ComplexMatrix.scala 170:34]
  ComplexDotProduct dot_0 ( // @[ComplexMatrix.scala 170:34]
    .clock(dot_0_clock),
    .io_a_0_real(dot_0_io_a_0_real),
    .io_a_0_imag(dot_0_io_a_0_imag),
    .io_a_1_real(dot_0_io_a_1_real),
    .io_a_1_imag(dot_0_io_a_1_imag),
    .io_a_2_real(dot_0_io_a_2_real),
    .io_a_2_imag(dot_0_io_a_2_imag),
    .io_a_3_real(dot_0_io_a_3_real),
    .io_a_3_imag(dot_0_io_a_3_imag),
    .io_b_0_real(dot_0_io_b_0_real),
    .io_b_0_imag(dot_0_io_b_0_imag),
    .io_b_1_real(dot_0_io_b_1_real),
    .io_b_1_imag(dot_0_io_b_1_imag),
    .io_b_2_real(dot_0_io_b_2_real),
    .io_b_2_imag(dot_0_io_b_2_imag),
    .io_b_3_real(dot_0_io_b_3_real),
    .io_b_3_imag(dot_0_io_b_3_imag),
    .io_y_real(dot_0_io_y_real),
    .io_y_imag(dot_0_io_y_imag)
  );
  ComplexDotProduct dot_1 ( // @[ComplexMatrix.scala 170:34]
    .clock(dot_1_clock),
    .io_a_0_real(dot_1_io_a_0_real),
    .io_a_0_imag(dot_1_io_a_0_imag),
    .io_a_1_real(dot_1_io_a_1_real),
    .io_a_1_imag(dot_1_io_a_1_imag),
    .io_a_2_real(dot_1_io_a_2_real),
    .io_a_2_imag(dot_1_io_a_2_imag),
    .io_a_3_real(dot_1_io_a_3_real),
    .io_a_3_imag(dot_1_io_a_3_imag),
    .io_b_0_real(dot_1_io_b_0_real),
    .io_b_0_imag(dot_1_io_b_0_imag),
    .io_b_1_real(dot_1_io_b_1_real),
    .io_b_1_imag(dot_1_io_b_1_imag),
    .io_b_2_real(dot_1_io_b_2_real),
    .io_b_2_imag(dot_1_io_b_2_imag),
    .io_b_3_real(dot_1_io_b_3_real),
    .io_b_3_imag(dot_1_io_b_3_imag),
    .io_y_real(dot_1_io_y_real),
    .io_y_imag(dot_1_io_y_imag)
  );
  ComplexDotProduct dot_2 ( // @[ComplexMatrix.scala 170:34]
    .clock(dot_2_clock),
    .io_a_0_real(dot_2_io_a_0_real),
    .io_a_0_imag(dot_2_io_a_0_imag),
    .io_a_1_real(dot_2_io_a_1_real),
    .io_a_1_imag(dot_2_io_a_1_imag),
    .io_a_2_real(dot_2_io_a_2_real),
    .io_a_2_imag(dot_2_io_a_2_imag),
    .io_a_3_real(dot_2_io_a_3_real),
    .io_a_3_imag(dot_2_io_a_3_imag),
    .io_b_0_real(dot_2_io_b_0_real),
    .io_b_0_imag(dot_2_io_b_0_imag),
    .io_b_1_real(dot_2_io_b_1_real),
    .io_b_1_imag(dot_2_io_b_1_imag),
    .io_b_2_real(dot_2_io_b_2_real),
    .io_b_2_imag(dot_2_io_b_2_imag),
    .io_b_3_real(dot_2_io_b_3_real),
    .io_b_3_imag(dot_2_io_b_3_imag),
    .io_y_real(dot_2_io_y_real),
    .io_y_imag(dot_2_io_y_imag)
  );
  ComplexDotProduct dot_3 ( // @[ComplexMatrix.scala 170:34]
    .clock(dot_3_clock),
    .io_a_0_real(dot_3_io_a_0_real),
    .io_a_0_imag(dot_3_io_a_0_imag),
    .io_a_1_real(dot_3_io_a_1_real),
    .io_a_1_imag(dot_3_io_a_1_imag),
    .io_a_2_real(dot_3_io_a_2_real),
    .io_a_2_imag(dot_3_io_a_2_imag),
    .io_a_3_real(dot_3_io_a_3_real),
    .io_a_3_imag(dot_3_io_a_3_imag),
    .io_b_0_real(dot_3_io_b_0_real),
    .io_b_0_imag(dot_3_io_b_0_imag),
    .io_b_1_real(dot_3_io_b_1_real),
    .io_b_1_imag(dot_3_io_b_1_imag),
    .io_b_2_real(dot_3_io_b_2_real),
    .io_b_2_imag(dot_3_io_b_2_imag),
    .io_b_3_real(dot_3_io_b_3_real),
    .io_b_3_imag(dot_3_io_b_3_imag),
    .io_y_real(dot_3_io_y_real),
    .io_y_imag(dot_3_io_y_imag)
  );
  assign io_out_0_real = dot_0_io_y_real[31:0]; // @[ComplexMatrix.scala 177:15]
  assign io_out_0_imag = dot_0_io_y_imag[31:0]; // @[ComplexMatrix.scala 177:15]
  assign io_out_1_real = dot_1_io_y_real[31:0]; // @[ComplexMatrix.scala 177:15]
  assign io_out_1_imag = dot_1_io_y_imag[31:0]; // @[ComplexMatrix.scala 177:15]
  assign io_out_2_real = dot_2_io_y_real[31:0]; // @[ComplexMatrix.scala 177:15]
  assign io_out_2_imag = dot_2_io_y_imag[31:0]; // @[ComplexMatrix.scala 177:15]
  assign io_out_3_real = dot_3_io_y_real[31:0]; // @[ComplexMatrix.scala 177:15]
  assign io_out_3_imag = dot_3_io_y_imag[31:0]; // @[ComplexMatrix.scala 177:15]
  assign dot_0_clock = clock;
  assign dot_0_io_a_0_real = io_mat_data_0_0_real; // @[ComplexMatrix.scala 174:22]
  assign dot_0_io_a_0_imag = io_mat_data_0_0_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_0_io_a_1_real = io_mat_data_0_1_real; // @[ComplexMatrix.scala 174:22]
  assign dot_0_io_a_1_imag = io_mat_data_0_1_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_0_io_a_2_real = io_mat_data_0_2_real; // @[ComplexMatrix.scala 174:22]
  assign dot_0_io_a_2_imag = io_mat_data_0_2_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_0_io_a_3_real = io_mat_data_0_3_real; // @[ComplexMatrix.scala 174:22]
  assign dot_0_io_a_3_imag = io_mat_data_0_3_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_0_io_b_0_real = io_vec_0_real; // @[ComplexMatrix.scala 175:22]
  assign dot_0_io_b_0_imag = io_vec_0_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_0_io_b_1_real = io_vec_1_real; // @[ComplexMatrix.scala 175:22]
  assign dot_0_io_b_1_imag = io_vec_1_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_0_io_b_2_real = io_vec_2_real; // @[ComplexMatrix.scala 175:22]
  assign dot_0_io_b_2_imag = io_vec_2_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_0_io_b_3_real = io_vec_3_real; // @[ComplexMatrix.scala 175:22]
  assign dot_0_io_b_3_imag = io_vec_3_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_1_clock = clock;
  assign dot_1_io_a_0_real = io_mat_data_1_0_real; // @[ComplexMatrix.scala 174:22]
  assign dot_1_io_a_0_imag = io_mat_data_1_0_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_1_io_a_1_real = io_mat_data_1_1_real; // @[ComplexMatrix.scala 174:22]
  assign dot_1_io_a_1_imag = io_mat_data_1_1_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_1_io_a_2_real = io_mat_data_1_2_real; // @[ComplexMatrix.scala 174:22]
  assign dot_1_io_a_2_imag = io_mat_data_1_2_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_1_io_a_3_real = io_mat_data_1_3_real; // @[ComplexMatrix.scala 174:22]
  assign dot_1_io_a_3_imag = io_mat_data_1_3_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_1_io_b_0_real = io_vec_0_real; // @[ComplexMatrix.scala 175:22]
  assign dot_1_io_b_0_imag = io_vec_0_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_1_io_b_1_real = io_vec_1_real; // @[ComplexMatrix.scala 175:22]
  assign dot_1_io_b_1_imag = io_vec_1_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_1_io_b_2_real = io_vec_2_real; // @[ComplexMatrix.scala 175:22]
  assign dot_1_io_b_2_imag = io_vec_2_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_1_io_b_3_real = io_vec_3_real; // @[ComplexMatrix.scala 175:22]
  assign dot_1_io_b_3_imag = io_vec_3_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_2_clock = clock;
  assign dot_2_io_a_0_real = io_mat_data_2_0_real; // @[ComplexMatrix.scala 174:22]
  assign dot_2_io_a_0_imag = io_mat_data_2_0_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_2_io_a_1_real = io_mat_data_2_1_real; // @[ComplexMatrix.scala 174:22]
  assign dot_2_io_a_1_imag = io_mat_data_2_1_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_2_io_a_2_real = io_mat_data_2_2_real; // @[ComplexMatrix.scala 174:22]
  assign dot_2_io_a_2_imag = io_mat_data_2_2_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_2_io_a_3_real = io_mat_data_2_3_real; // @[ComplexMatrix.scala 174:22]
  assign dot_2_io_a_3_imag = io_mat_data_2_3_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_2_io_b_0_real = io_vec_0_real; // @[ComplexMatrix.scala 175:22]
  assign dot_2_io_b_0_imag = io_vec_0_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_2_io_b_1_real = io_vec_1_real; // @[ComplexMatrix.scala 175:22]
  assign dot_2_io_b_1_imag = io_vec_1_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_2_io_b_2_real = io_vec_2_real; // @[ComplexMatrix.scala 175:22]
  assign dot_2_io_b_2_imag = io_vec_2_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_2_io_b_3_real = io_vec_3_real; // @[ComplexMatrix.scala 175:22]
  assign dot_2_io_b_3_imag = io_vec_3_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_3_clock = clock;
  assign dot_3_io_a_0_real = io_mat_data_3_0_real; // @[ComplexMatrix.scala 174:22]
  assign dot_3_io_a_0_imag = io_mat_data_3_0_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_3_io_a_1_real = io_mat_data_3_1_real; // @[ComplexMatrix.scala 174:22]
  assign dot_3_io_a_1_imag = io_mat_data_3_1_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_3_io_a_2_real = io_mat_data_3_2_real; // @[ComplexMatrix.scala 174:22]
  assign dot_3_io_a_2_imag = io_mat_data_3_2_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_3_io_a_3_real = io_mat_data_3_3_real; // @[ComplexMatrix.scala 174:22]
  assign dot_3_io_a_3_imag = io_mat_data_3_3_imag; // @[ComplexMatrix.scala 174:22]
  assign dot_3_io_b_0_real = io_vec_0_real; // @[ComplexMatrix.scala 175:22]
  assign dot_3_io_b_0_imag = io_vec_0_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_3_io_b_1_real = io_vec_1_real; // @[ComplexMatrix.scala 175:22]
  assign dot_3_io_b_1_imag = io_vec_1_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_3_io_b_2_real = io_vec_2_real; // @[ComplexMatrix.scala 175:22]
  assign dot_3_io_b_2_imag = io_vec_2_imag; // @[ComplexMatrix.scala 175:22]
  assign dot_3_io_b_3_real = io_vec_3_real; // @[ComplexMatrix.scala 175:22]
  assign dot_3_io_b_3_imag = io_vec_3_imag; // @[ComplexMatrix.scala 175:22]
endmodule
module ComplexMatrixMatrixProduct(
  input         clock,
  input         reset,
  input  [31:0] io_A_data_0_0_real,
  input  [31:0] io_A_data_0_0_imag,
  input  [31:0] io_A_data_0_1_real,
  input  [31:0] io_A_data_0_1_imag,
  input  [31:0] io_A_data_0_2_real,
  input  [31:0] io_A_data_0_2_imag,
  input  [31:0] io_A_data_0_3_real,
  input  [31:0] io_A_data_0_3_imag,
  input  [31:0] io_A_data_1_0_real,
  input  [31:0] io_A_data_1_0_imag,
  input  [31:0] io_A_data_1_1_real,
  input  [31:0] io_A_data_1_1_imag,
  input  [31:0] io_A_data_1_2_real,
  input  [31:0] io_A_data_1_2_imag,
  input  [31:0] io_A_data_1_3_real,
  input  [31:0] io_A_data_1_3_imag,
  input  [31:0] io_A_data_2_0_real,
  input  [31:0] io_A_data_2_0_imag,
  input  [31:0] io_A_data_2_1_real,
  input  [31:0] io_A_data_2_1_imag,
  input  [31:0] io_A_data_2_2_real,
  input  [31:0] io_A_data_2_2_imag,
  input  [31:0] io_A_data_2_3_real,
  input  [31:0] io_A_data_2_3_imag,
  input  [31:0] io_A_data_3_0_real,
  input  [31:0] io_A_data_3_0_imag,
  input  [31:0] io_A_data_3_1_real,
  input  [31:0] io_A_data_3_1_imag,
  input  [31:0] io_A_data_3_2_real,
  input  [31:0] io_A_data_3_2_imag,
  input  [31:0] io_A_data_3_3_real,
  input  [31:0] io_A_data_3_3_imag,
  input  [31:0] io_B_data_0_0_real,
  input  [31:0] io_B_data_0_0_imag,
  input  [31:0] io_B_data_0_1_real,
  input  [31:0] io_B_data_0_1_imag,
  input  [31:0] io_B_data_0_2_real,
  input  [31:0] io_B_data_0_2_imag,
  input  [31:0] io_B_data_0_3_real,
  input  [31:0] io_B_data_0_3_imag,
  input  [31:0] io_B_data_1_0_real,
  input  [31:0] io_B_data_1_0_imag,
  input  [31:0] io_B_data_1_1_real,
  input  [31:0] io_B_data_1_1_imag,
  input  [31:0] io_B_data_1_2_real,
  input  [31:0] io_B_data_1_2_imag,
  input  [31:0] io_B_data_1_3_real,
  input  [31:0] io_B_data_1_3_imag,
  input  [31:0] io_B_data_2_0_real,
  input  [31:0] io_B_data_2_0_imag,
  input  [31:0] io_B_data_2_1_real,
  input  [31:0] io_B_data_2_1_imag,
  input  [31:0] io_B_data_2_2_real,
  input  [31:0] io_B_data_2_2_imag,
  input  [31:0] io_B_data_2_3_real,
  input  [31:0] io_B_data_2_3_imag,
  input  [31:0] io_B_data_3_0_real,
  input  [31:0] io_B_data_3_0_imag,
  input  [31:0] io_B_data_3_1_real,
  input  [31:0] io_B_data_3_1_imag,
  input  [31:0] io_B_data_3_2_real,
  input  [31:0] io_B_data_3_2_imag,
  input  [31:0] io_B_data_3_3_real,
  input  [31:0] io_B_data_3_3_imag,
  output [31:0] io_out_data_0_0_real,
  output [31:0] io_out_data_0_0_imag,
  output [31:0] io_out_data_0_1_real,
  output [31:0] io_out_data_0_1_imag,
  output [31:0] io_out_data_0_2_real,
  output [31:0] io_out_data_0_2_imag,
  output [31:0] io_out_data_0_3_real,
  output [31:0] io_out_data_0_3_imag,
  output [31:0] io_out_data_1_0_real,
  output [31:0] io_out_data_1_0_imag,
  output [31:0] io_out_data_1_1_real,
  output [31:0] io_out_data_1_1_imag,
  output [31:0] io_out_data_1_2_real,
  output [31:0] io_out_data_1_2_imag,
  output [31:0] io_out_data_1_3_real,
  output [31:0] io_out_data_1_3_imag,
  output [31:0] io_out_data_2_0_real,
  output [31:0] io_out_data_2_0_imag,
  output [31:0] io_out_data_2_1_real,
  output [31:0] io_out_data_2_1_imag,
  output [31:0] io_out_data_2_2_real,
  output [31:0] io_out_data_2_2_imag,
  output [31:0] io_out_data_2_3_real,
  output [31:0] io_out_data_2_3_imag,
  output [31:0] io_out_data_3_0_real,
  output [31:0] io_out_data_3_0_imag,
  output [31:0] io_out_data_3_1_real,
  output [31:0] io_out_data_3_1_imag,
  output [31:0] io_out_data_3_2_real,
  output [31:0] io_out_data_3_2_imag,
  output [31:0] io_out_data_3_3_real,
  output [31:0] io_out_data_3_3_imag
);
  wire  matVecMul_0_clock; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_0_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_0_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_0_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_0_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_0_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_0_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_0_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_0_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_1_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_1_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_1_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_1_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_1_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_1_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_1_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_1_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_2_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_2_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_2_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_2_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_2_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_2_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_2_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_2_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_3_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_3_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_3_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_3_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_3_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_3_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_3_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_mat_data_3_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_vec_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_vec_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_vec_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_vec_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_vec_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_vec_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_vec_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_vec_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_out_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_out_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_out_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_out_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_out_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_out_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_out_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_0_io_out_3_imag; // @[ComplexMatrix.scala 189:37]
  wire  matVecMul_1_clock; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_0_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_0_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_0_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_0_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_0_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_0_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_0_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_0_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_1_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_1_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_1_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_1_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_1_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_1_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_1_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_1_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_2_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_2_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_2_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_2_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_2_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_2_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_2_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_2_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_3_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_3_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_3_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_3_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_3_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_3_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_3_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_mat_data_3_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_vec_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_vec_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_vec_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_vec_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_vec_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_vec_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_vec_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_vec_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_out_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_out_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_out_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_out_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_out_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_out_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_out_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_1_io_out_3_imag; // @[ComplexMatrix.scala 189:37]
  wire  matVecMul_2_clock; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_0_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_0_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_0_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_0_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_0_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_0_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_0_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_0_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_1_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_1_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_1_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_1_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_1_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_1_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_1_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_1_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_2_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_2_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_2_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_2_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_2_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_2_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_2_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_2_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_3_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_3_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_3_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_3_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_3_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_3_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_3_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_mat_data_3_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_vec_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_vec_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_vec_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_vec_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_vec_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_vec_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_vec_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_vec_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_out_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_out_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_out_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_out_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_out_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_out_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_out_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_2_io_out_3_imag; // @[ComplexMatrix.scala 189:37]
  wire  matVecMul_3_clock; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_0_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_0_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_0_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_0_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_0_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_0_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_0_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_0_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_1_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_1_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_1_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_1_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_1_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_1_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_1_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_1_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_2_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_2_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_2_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_2_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_2_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_2_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_2_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_2_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_3_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_3_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_3_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_3_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_3_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_3_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_3_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_mat_data_3_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_vec_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_vec_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_vec_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_vec_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_vec_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_vec_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_vec_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_vec_3_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_out_0_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_out_0_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_out_1_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_out_1_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_out_2_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_out_2_imag; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_out_3_real; // @[ComplexMatrix.scala 189:37]
  wire [31:0] matVecMul_3_io_out_3_imag; // @[ComplexMatrix.scala 189:37]
  ComplexMatrixVectorProduct matVecMul_0 ( // @[ComplexMatrix.scala 189:37]
    .clock(matVecMul_0_clock),
    .io_mat_data_0_0_real(matVecMul_0_io_mat_data_0_0_real),
    .io_mat_data_0_0_imag(matVecMul_0_io_mat_data_0_0_imag),
    .io_mat_data_0_1_real(matVecMul_0_io_mat_data_0_1_real),
    .io_mat_data_0_1_imag(matVecMul_0_io_mat_data_0_1_imag),
    .io_mat_data_0_2_real(matVecMul_0_io_mat_data_0_2_real),
    .io_mat_data_0_2_imag(matVecMul_0_io_mat_data_0_2_imag),
    .io_mat_data_0_3_real(matVecMul_0_io_mat_data_0_3_real),
    .io_mat_data_0_3_imag(matVecMul_0_io_mat_data_0_3_imag),
    .io_mat_data_1_0_real(matVecMul_0_io_mat_data_1_0_real),
    .io_mat_data_1_0_imag(matVecMul_0_io_mat_data_1_0_imag),
    .io_mat_data_1_1_real(matVecMul_0_io_mat_data_1_1_real),
    .io_mat_data_1_1_imag(matVecMul_0_io_mat_data_1_1_imag),
    .io_mat_data_1_2_real(matVecMul_0_io_mat_data_1_2_real),
    .io_mat_data_1_2_imag(matVecMul_0_io_mat_data_1_2_imag),
    .io_mat_data_1_3_real(matVecMul_0_io_mat_data_1_3_real),
    .io_mat_data_1_3_imag(matVecMul_0_io_mat_data_1_3_imag),
    .io_mat_data_2_0_real(matVecMul_0_io_mat_data_2_0_real),
    .io_mat_data_2_0_imag(matVecMul_0_io_mat_data_2_0_imag),
    .io_mat_data_2_1_real(matVecMul_0_io_mat_data_2_1_real),
    .io_mat_data_2_1_imag(matVecMul_0_io_mat_data_2_1_imag),
    .io_mat_data_2_2_real(matVecMul_0_io_mat_data_2_2_real),
    .io_mat_data_2_2_imag(matVecMul_0_io_mat_data_2_2_imag),
    .io_mat_data_2_3_real(matVecMul_0_io_mat_data_2_3_real),
    .io_mat_data_2_3_imag(matVecMul_0_io_mat_data_2_3_imag),
    .io_mat_data_3_0_real(matVecMul_0_io_mat_data_3_0_real),
    .io_mat_data_3_0_imag(matVecMul_0_io_mat_data_3_0_imag),
    .io_mat_data_3_1_real(matVecMul_0_io_mat_data_3_1_real),
    .io_mat_data_3_1_imag(matVecMul_0_io_mat_data_3_1_imag),
    .io_mat_data_3_2_real(matVecMul_0_io_mat_data_3_2_real),
    .io_mat_data_3_2_imag(matVecMul_0_io_mat_data_3_2_imag),
    .io_mat_data_3_3_real(matVecMul_0_io_mat_data_3_3_real),
    .io_mat_data_3_3_imag(matVecMul_0_io_mat_data_3_3_imag),
    .io_vec_0_real(matVecMul_0_io_vec_0_real),
    .io_vec_0_imag(matVecMul_0_io_vec_0_imag),
    .io_vec_1_real(matVecMul_0_io_vec_1_real),
    .io_vec_1_imag(matVecMul_0_io_vec_1_imag),
    .io_vec_2_real(matVecMul_0_io_vec_2_real),
    .io_vec_2_imag(matVecMul_0_io_vec_2_imag),
    .io_vec_3_real(matVecMul_0_io_vec_3_real),
    .io_vec_3_imag(matVecMul_0_io_vec_3_imag),
    .io_out_0_real(matVecMul_0_io_out_0_real),
    .io_out_0_imag(matVecMul_0_io_out_0_imag),
    .io_out_1_real(matVecMul_0_io_out_1_real),
    .io_out_1_imag(matVecMul_0_io_out_1_imag),
    .io_out_2_real(matVecMul_0_io_out_2_real),
    .io_out_2_imag(matVecMul_0_io_out_2_imag),
    .io_out_3_real(matVecMul_0_io_out_3_real),
    .io_out_3_imag(matVecMul_0_io_out_3_imag)
  );
  ComplexMatrixVectorProduct matVecMul_1 ( // @[ComplexMatrix.scala 189:37]
    .clock(matVecMul_1_clock),
    .io_mat_data_0_0_real(matVecMul_1_io_mat_data_0_0_real),
    .io_mat_data_0_0_imag(matVecMul_1_io_mat_data_0_0_imag),
    .io_mat_data_0_1_real(matVecMul_1_io_mat_data_0_1_real),
    .io_mat_data_0_1_imag(matVecMul_1_io_mat_data_0_1_imag),
    .io_mat_data_0_2_real(matVecMul_1_io_mat_data_0_2_real),
    .io_mat_data_0_2_imag(matVecMul_1_io_mat_data_0_2_imag),
    .io_mat_data_0_3_real(matVecMul_1_io_mat_data_0_3_real),
    .io_mat_data_0_3_imag(matVecMul_1_io_mat_data_0_3_imag),
    .io_mat_data_1_0_real(matVecMul_1_io_mat_data_1_0_real),
    .io_mat_data_1_0_imag(matVecMul_1_io_mat_data_1_0_imag),
    .io_mat_data_1_1_real(matVecMul_1_io_mat_data_1_1_real),
    .io_mat_data_1_1_imag(matVecMul_1_io_mat_data_1_1_imag),
    .io_mat_data_1_2_real(matVecMul_1_io_mat_data_1_2_real),
    .io_mat_data_1_2_imag(matVecMul_1_io_mat_data_1_2_imag),
    .io_mat_data_1_3_real(matVecMul_1_io_mat_data_1_3_real),
    .io_mat_data_1_3_imag(matVecMul_1_io_mat_data_1_3_imag),
    .io_mat_data_2_0_real(matVecMul_1_io_mat_data_2_0_real),
    .io_mat_data_2_0_imag(matVecMul_1_io_mat_data_2_0_imag),
    .io_mat_data_2_1_real(matVecMul_1_io_mat_data_2_1_real),
    .io_mat_data_2_1_imag(matVecMul_1_io_mat_data_2_1_imag),
    .io_mat_data_2_2_real(matVecMul_1_io_mat_data_2_2_real),
    .io_mat_data_2_2_imag(matVecMul_1_io_mat_data_2_2_imag),
    .io_mat_data_2_3_real(matVecMul_1_io_mat_data_2_3_real),
    .io_mat_data_2_3_imag(matVecMul_1_io_mat_data_2_3_imag),
    .io_mat_data_3_0_real(matVecMul_1_io_mat_data_3_0_real),
    .io_mat_data_3_0_imag(matVecMul_1_io_mat_data_3_0_imag),
    .io_mat_data_3_1_real(matVecMul_1_io_mat_data_3_1_real),
    .io_mat_data_3_1_imag(matVecMul_1_io_mat_data_3_1_imag),
    .io_mat_data_3_2_real(matVecMul_1_io_mat_data_3_2_real),
    .io_mat_data_3_2_imag(matVecMul_1_io_mat_data_3_2_imag),
    .io_mat_data_3_3_real(matVecMul_1_io_mat_data_3_3_real),
    .io_mat_data_3_3_imag(matVecMul_1_io_mat_data_3_3_imag),
    .io_vec_0_real(matVecMul_1_io_vec_0_real),
    .io_vec_0_imag(matVecMul_1_io_vec_0_imag),
    .io_vec_1_real(matVecMul_1_io_vec_1_real),
    .io_vec_1_imag(matVecMul_1_io_vec_1_imag),
    .io_vec_2_real(matVecMul_1_io_vec_2_real),
    .io_vec_2_imag(matVecMul_1_io_vec_2_imag),
    .io_vec_3_real(matVecMul_1_io_vec_3_real),
    .io_vec_3_imag(matVecMul_1_io_vec_3_imag),
    .io_out_0_real(matVecMul_1_io_out_0_real),
    .io_out_0_imag(matVecMul_1_io_out_0_imag),
    .io_out_1_real(matVecMul_1_io_out_1_real),
    .io_out_1_imag(matVecMul_1_io_out_1_imag),
    .io_out_2_real(matVecMul_1_io_out_2_real),
    .io_out_2_imag(matVecMul_1_io_out_2_imag),
    .io_out_3_real(matVecMul_1_io_out_3_real),
    .io_out_3_imag(matVecMul_1_io_out_3_imag)
  );
  ComplexMatrixVectorProduct matVecMul_2 ( // @[ComplexMatrix.scala 189:37]
    .clock(matVecMul_2_clock),
    .io_mat_data_0_0_real(matVecMul_2_io_mat_data_0_0_real),
    .io_mat_data_0_0_imag(matVecMul_2_io_mat_data_0_0_imag),
    .io_mat_data_0_1_real(matVecMul_2_io_mat_data_0_1_real),
    .io_mat_data_0_1_imag(matVecMul_2_io_mat_data_0_1_imag),
    .io_mat_data_0_2_real(matVecMul_2_io_mat_data_0_2_real),
    .io_mat_data_0_2_imag(matVecMul_2_io_mat_data_0_2_imag),
    .io_mat_data_0_3_real(matVecMul_2_io_mat_data_0_3_real),
    .io_mat_data_0_3_imag(matVecMul_2_io_mat_data_0_3_imag),
    .io_mat_data_1_0_real(matVecMul_2_io_mat_data_1_0_real),
    .io_mat_data_1_0_imag(matVecMul_2_io_mat_data_1_0_imag),
    .io_mat_data_1_1_real(matVecMul_2_io_mat_data_1_1_real),
    .io_mat_data_1_1_imag(matVecMul_2_io_mat_data_1_1_imag),
    .io_mat_data_1_2_real(matVecMul_2_io_mat_data_1_2_real),
    .io_mat_data_1_2_imag(matVecMul_2_io_mat_data_1_2_imag),
    .io_mat_data_1_3_real(matVecMul_2_io_mat_data_1_3_real),
    .io_mat_data_1_3_imag(matVecMul_2_io_mat_data_1_3_imag),
    .io_mat_data_2_0_real(matVecMul_2_io_mat_data_2_0_real),
    .io_mat_data_2_0_imag(matVecMul_2_io_mat_data_2_0_imag),
    .io_mat_data_2_1_real(matVecMul_2_io_mat_data_2_1_real),
    .io_mat_data_2_1_imag(matVecMul_2_io_mat_data_2_1_imag),
    .io_mat_data_2_2_real(matVecMul_2_io_mat_data_2_2_real),
    .io_mat_data_2_2_imag(matVecMul_2_io_mat_data_2_2_imag),
    .io_mat_data_2_3_real(matVecMul_2_io_mat_data_2_3_real),
    .io_mat_data_2_3_imag(matVecMul_2_io_mat_data_2_3_imag),
    .io_mat_data_3_0_real(matVecMul_2_io_mat_data_3_0_real),
    .io_mat_data_3_0_imag(matVecMul_2_io_mat_data_3_0_imag),
    .io_mat_data_3_1_real(matVecMul_2_io_mat_data_3_1_real),
    .io_mat_data_3_1_imag(matVecMul_2_io_mat_data_3_1_imag),
    .io_mat_data_3_2_real(matVecMul_2_io_mat_data_3_2_real),
    .io_mat_data_3_2_imag(matVecMul_2_io_mat_data_3_2_imag),
    .io_mat_data_3_3_real(matVecMul_2_io_mat_data_3_3_real),
    .io_mat_data_3_3_imag(matVecMul_2_io_mat_data_3_3_imag),
    .io_vec_0_real(matVecMul_2_io_vec_0_real),
    .io_vec_0_imag(matVecMul_2_io_vec_0_imag),
    .io_vec_1_real(matVecMul_2_io_vec_1_real),
    .io_vec_1_imag(matVecMul_2_io_vec_1_imag),
    .io_vec_2_real(matVecMul_2_io_vec_2_real),
    .io_vec_2_imag(matVecMul_2_io_vec_2_imag),
    .io_vec_3_real(matVecMul_2_io_vec_3_real),
    .io_vec_3_imag(matVecMul_2_io_vec_3_imag),
    .io_out_0_real(matVecMul_2_io_out_0_real),
    .io_out_0_imag(matVecMul_2_io_out_0_imag),
    .io_out_1_real(matVecMul_2_io_out_1_real),
    .io_out_1_imag(matVecMul_2_io_out_1_imag),
    .io_out_2_real(matVecMul_2_io_out_2_real),
    .io_out_2_imag(matVecMul_2_io_out_2_imag),
    .io_out_3_real(matVecMul_2_io_out_3_real),
    .io_out_3_imag(matVecMul_2_io_out_3_imag)
  );
  ComplexMatrixVectorProduct matVecMul_3 ( // @[ComplexMatrix.scala 189:37]
    .clock(matVecMul_3_clock),
    .io_mat_data_0_0_real(matVecMul_3_io_mat_data_0_0_real),
    .io_mat_data_0_0_imag(matVecMul_3_io_mat_data_0_0_imag),
    .io_mat_data_0_1_real(matVecMul_3_io_mat_data_0_1_real),
    .io_mat_data_0_1_imag(matVecMul_3_io_mat_data_0_1_imag),
    .io_mat_data_0_2_real(matVecMul_3_io_mat_data_0_2_real),
    .io_mat_data_0_2_imag(matVecMul_3_io_mat_data_0_2_imag),
    .io_mat_data_0_3_real(matVecMul_3_io_mat_data_0_3_real),
    .io_mat_data_0_3_imag(matVecMul_3_io_mat_data_0_3_imag),
    .io_mat_data_1_0_real(matVecMul_3_io_mat_data_1_0_real),
    .io_mat_data_1_0_imag(matVecMul_3_io_mat_data_1_0_imag),
    .io_mat_data_1_1_real(matVecMul_3_io_mat_data_1_1_real),
    .io_mat_data_1_1_imag(matVecMul_3_io_mat_data_1_1_imag),
    .io_mat_data_1_2_real(matVecMul_3_io_mat_data_1_2_real),
    .io_mat_data_1_2_imag(matVecMul_3_io_mat_data_1_2_imag),
    .io_mat_data_1_3_real(matVecMul_3_io_mat_data_1_3_real),
    .io_mat_data_1_3_imag(matVecMul_3_io_mat_data_1_3_imag),
    .io_mat_data_2_0_real(matVecMul_3_io_mat_data_2_0_real),
    .io_mat_data_2_0_imag(matVecMul_3_io_mat_data_2_0_imag),
    .io_mat_data_2_1_real(matVecMul_3_io_mat_data_2_1_real),
    .io_mat_data_2_1_imag(matVecMul_3_io_mat_data_2_1_imag),
    .io_mat_data_2_2_real(matVecMul_3_io_mat_data_2_2_real),
    .io_mat_data_2_2_imag(matVecMul_3_io_mat_data_2_2_imag),
    .io_mat_data_2_3_real(matVecMul_3_io_mat_data_2_3_real),
    .io_mat_data_2_3_imag(matVecMul_3_io_mat_data_2_3_imag),
    .io_mat_data_3_0_real(matVecMul_3_io_mat_data_3_0_real),
    .io_mat_data_3_0_imag(matVecMul_3_io_mat_data_3_0_imag),
    .io_mat_data_3_1_real(matVecMul_3_io_mat_data_3_1_real),
    .io_mat_data_3_1_imag(matVecMul_3_io_mat_data_3_1_imag),
    .io_mat_data_3_2_real(matVecMul_3_io_mat_data_3_2_real),
    .io_mat_data_3_2_imag(matVecMul_3_io_mat_data_3_2_imag),
    .io_mat_data_3_3_real(matVecMul_3_io_mat_data_3_3_real),
    .io_mat_data_3_3_imag(matVecMul_3_io_mat_data_3_3_imag),
    .io_vec_0_real(matVecMul_3_io_vec_0_real),
    .io_vec_0_imag(matVecMul_3_io_vec_0_imag),
    .io_vec_1_real(matVecMul_3_io_vec_1_real),
    .io_vec_1_imag(matVecMul_3_io_vec_1_imag),
    .io_vec_2_real(matVecMul_3_io_vec_2_real),
    .io_vec_2_imag(matVecMul_3_io_vec_2_imag),
    .io_vec_3_real(matVecMul_3_io_vec_3_real),
    .io_vec_3_imag(matVecMul_3_io_vec_3_imag),
    .io_out_0_real(matVecMul_3_io_out_0_real),
    .io_out_0_imag(matVecMul_3_io_out_0_imag),
    .io_out_1_real(matVecMul_3_io_out_1_real),
    .io_out_1_imag(matVecMul_3_io_out_1_imag),
    .io_out_2_real(matVecMul_3_io_out_2_real),
    .io_out_2_imag(matVecMul_3_io_out_2_imag),
    .io_out_3_real(matVecMul_3_io_out_3_real),
    .io_out_3_imag(matVecMul_3_io_out_3_imag)
  );
  assign io_out_data_0_0_real = matVecMul_0_io_out_0_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_0_0_imag = matVecMul_0_io_out_0_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_0_1_real = matVecMul_1_io_out_0_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_0_1_imag = matVecMul_1_io_out_0_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_0_2_real = matVecMul_2_io_out_0_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_0_2_imag = matVecMul_2_io_out_0_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_0_3_real = matVecMul_3_io_out_0_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_0_3_imag = matVecMul_3_io_out_0_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_1_0_real = matVecMul_0_io_out_1_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_1_0_imag = matVecMul_0_io_out_1_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_1_1_real = matVecMul_1_io_out_1_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_1_1_imag = matVecMul_1_io_out_1_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_1_2_real = matVecMul_2_io_out_1_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_1_2_imag = matVecMul_2_io_out_1_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_1_3_real = matVecMul_3_io_out_1_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_1_3_imag = matVecMul_3_io_out_1_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_2_0_real = matVecMul_0_io_out_2_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_2_0_imag = matVecMul_0_io_out_2_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_2_1_real = matVecMul_1_io_out_2_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_2_1_imag = matVecMul_1_io_out_2_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_2_2_real = matVecMul_2_io_out_2_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_2_2_imag = matVecMul_2_io_out_2_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_2_3_real = matVecMul_3_io_out_2_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_2_3_imag = matVecMul_3_io_out_2_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_3_0_real = matVecMul_0_io_out_3_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_3_0_imag = matVecMul_0_io_out_3_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_3_1_real = matVecMul_1_io_out_3_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_3_1_imag = matVecMul_1_io_out_3_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_3_2_real = matVecMul_2_io_out_3_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_3_2_imag = matVecMul_2_io_out_3_imag; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_3_3_real = matVecMul_3_io_out_3_real; // @[ComplexMatrix.scala 197:25]
  assign io_out_data_3_3_imag = matVecMul_3_io_out_3_imag; // @[ComplexMatrix.scala 197:25]
  assign matVecMul_0_clock = clock;
  assign matVecMul_0_io_mat_data_0_0_real = io_A_data_0_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_0_0_imag = io_A_data_0_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_0_1_real = io_A_data_0_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_0_1_imag = io_A_data_0_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_0_2_real = io_A_data_0_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_0_2_imag = io_A_data_0_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_0_3_real = io_A_data_0_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_0_3_imag = io_A_data_0_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_1_0_real = io_A_data_1_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_1_0_imag = io_A_data_1_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_1_1_real = io_A_data_1_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_1_1_imag = io_A_data_1_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_1_2_real = io_A_data_1_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_1_2_imag = io_A_data_1_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_1_3_real = io_A_data_1_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_1_3_imag = io_A_data_1_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_2_0_real = io_A_data_2_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_2_0_imag = io_A_data_2_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_2_1_real = io_A_data_2_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_2_1_imag = io_A_data_2_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_2_2_real = io_A_data_2_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_2_2_imag = io_A_data_2_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_2_3_real = io_A_data_2_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_2_3_imag = io_A_data_2_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_3_0_real = io_A_data_3_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_3_0_imag = io_A_data_3_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_3_1_real = io_A_data_3_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_3_1_imag = io_A_data_3_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_3_2_real = io_A_data_3_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_3_2_imag = io_A_data_3_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_3_3_real = io_A_data_3_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_mat_data_3_3_imag = io_A_data_3_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_0_io_vec_0_real = io_B_data_0_0_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_0_io_vec_0_imag = io_B_data_0_0_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_0_io_vec_1_real = io_B_data_1_0_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_0_io_vec_1_imag = io_B_data_1_0_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_0_io_vec_2_real = io_B_data_2_0_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_0_io_vec_2_imag = io_B_data_2_0_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_0_io_vec_3_real = io_B_data_3_0_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_0_io_vec_3_imag = io_B_data_3_0_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_1_clock = clock;
  assign matVecMul_1_io_mat_data_0_0_real = io_A_data_0_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_0_0_imag = io_A_data_0_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_0_1_real = io_A_data_0_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_0_1_imag = io_A_data_0_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_0_2_real = io_A_data_0_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_0_2_imag = io_A_data_0_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_0_3_real = io_A_data_0_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_0_3_imag = io_A_data_0_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_1_0_real = io_A_data_1_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_1_0_imag = io_A_data_1_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_1_1_real = io_A_data_1_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_1_1_imag = io_A_data_1_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_1_2_real = io_A_data_1_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_1_2_imag = io_A_data_1_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_1_3_real = io_A_data_1_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_1_3_imag = io_A_data_1_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_2_0_real = io_A_data_2_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_2_0_imag = io_A_data_2_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_2_1_real = io_A_data_2_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_2_1_imag = io_A_data_2_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_2_2_real = io_A_data_2_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_2_2_imag = io_A_data_2_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_2_3_real = io_A_data_2_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_2_3_imag = io_A_data_2_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_3_0_real = io_A_data_3_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_3_0_imag = io_A_data_3_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_3_1_real = io_A_data_3_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_3_1_imag = io_A_data_3_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_3_2_real = io_A_data_3_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_3_2_imag = io_A_data_3_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_3_3_real = io_A_data_3_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_mat_data_3_3_imag = io_A_data_3_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_1_io_vec_0_real = io_B_data_0_1_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_1_io_vec_0_imag = io_B_data_0_1_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_1_io_vec_1_real = io_B_data_1_1_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_1_io_vec_1_imag = io_B_data_1_1_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_1_io_vec_2_real = io_B_data_2_1_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_1_io_vec_2_imag = io_B_data_2_1_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_1_io_vec_3_real = io_B_data_3_1_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_1_io_vec_3_imag = io_B_data_3_1_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_2_clock = clock;
  assign matVecMul_2_io_mat_data_0_0_real = io_A_data_0_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_0_0_imag = io_A_data_0_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_0_1_real = io_A_data_0_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_0_1_imag = io_A_data_0_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_0_2_real = io_A_data_0_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_0_2_imag = io_A_data_0_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_0_3_real = io_A_data_0_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_0_3_imag = io_A_data_0_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_1_0_real = io_A_data_1_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_1_0_imag = io_A_data_1_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_1_1_real = io_A_data_1_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_1_1_imag = io_A_data_1_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_1_2_real = io_A_data_1_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_1_2_imag = io_A_data_1_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_1_3_real = io_A_data_1_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_1_3_imag = io_A_data_1_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_2_0_real = io_A_data_2_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_2_0_imag = io_A_data_2_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_2_1_real = io_A_data_2_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_2_1_imag = io_A_data_2_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_2_2_real = io_A_data_2_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_2_2_imag = io_A_data_2_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_2_3_real = io_A_data_2_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_2_3_imag = io_A_data_2_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_3_0_real = io_A_data_3_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_3_0_imag = io_A_data_3_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_3_1_real = io_A_data_3_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_3_1_imag = io_A_data_3_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_3_2_real = io_A_data_3_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_3_2_imag = io_A_data_3_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_3_3_real = io_A_data_3_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_mat_data_3_3_imag = io_A_data_3_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_2_io_vec_0_real = io_B_data_0_2_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_2_io_vec_0_imag = io_B_data_0_2_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_2_io_vec_1_real = io_B_data_1_2_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_2_io_vec_1_imag = io_B_data_1_2_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_2_io_vec_2_real = io_B_data_2_2_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_2_io_vec_2_imag = io_B_data_2_2_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_2_io_vec_3_real = io_B_data_3_2_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_2_io_vec_3_imag = io_B_data_3_2_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_3_clock = clock;
  assign matVecMul_3_io_mat_data_0_0_real = io_A_data_0_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_0_0_imag = io_A_data_0_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_0_1_real = io_A_data_0_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_0_1_imag = io_A_data_0_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_0_2_real = io_A_data_0_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_0_2_imag = io_A_data_0_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_0_3_real = io_A_data_0_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_0_3_imag = io_A_data_0_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_1_0_real = io_A_data_1_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_1_0_imag = io_A_data_1_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_1_1_real = io_A_data_1_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_1_1_imag = io_A_data_1_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_1_2_real = io_A_data_1_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_1_2_imag = io_A_data_1_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_1_3_real = io_A_data_1_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_1_3_imag = io_A_data_1_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_2_0_real = io_A_data_2_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_2_0_imag = io_A_data_2_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_2_1_real = io_A_data_2_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_2_1_imag = io_A_data_2_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_2_2_real = io_A_data_2_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_2_2_imag = io_A_data_2_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_2_3_real = io_A_data_2_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_2_3_imag = io_A_data_2_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_3_0_real = io_A_data_3_0_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_3_0_imag = io_A_data_3_0_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_3_1_real = io_A_data_3_1_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_3_1_imag = io_A_data_3_1_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_3_2_real = io_A_data_3_2_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_3_2_imag = io_A_data_3_2_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_3_3_real = io_A_data_3_3_real; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_mat_data_3_3_imag = io_A_data_3_3_imag; // @[ComplexMatrix.scala 192:25]
  assign matVecMul_3_io_vec_0_real = io_B_data_0_3_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_3_io_vec_0_imag = io_B_data_0_3_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_3_io_vec_1_real = io_B_data_1_3_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_3_io_vec_1_imag = io_B_data_1_3_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_3_io_vec_2_real = io_B_data_2_3_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_3_io_vec_2_imag = io_B_data_2_3_imag; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_3_io_vec_3_real = io_B_data_3_3_real; // @[ComplexMatrix.scala 194:30]
  assign matVecMul_3_io_vec_3_imag = io_B_data_3_3_imag; // @[ComplexMatrix.scala 194:30]
endmodule
