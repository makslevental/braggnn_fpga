module RingBuffer(
  input         clock,
  input         reset,
  input         io_inData_valid,
  input  [31:0] io_inData_bits_0,
  input  [31:0] io_inData_bits_1,
  input  [31:0] io_inData_bits_2,
  input  [31:0] io_inData_bits_3,
  input  [31:0] io_inData_bits_4,
  input  [31:0] io_inData_bits_5,
  input  [31:0] io_inData_bits_6,
  input  [31:0] io_inData_bits_7,
  input  [31:0] io_inData_bits_8,
  input  [31:0] io_inData_bits_9,
  input         io_outData_ready,
  output        io_outData_valid,
  output [31:0] io_outData_bits_0
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:9]; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_io_outData_bits_0_MPORT_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_io_outData_bits_0_MPORT_addr; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_MPORT_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_MPORT_addr; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_mask; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_en; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_MPORT_1_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_MPORT_1_addr; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_1_mask; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_1_en; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_MPORT_2_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_MPORT_2_addr; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_2_mask; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_2_en; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_MPORT_3_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_MPORT_3_addr; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_3_mask; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_3_en; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_MPORT_4_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_MPORT_4_addr; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_4_mask; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_4_en; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_MPORT_5_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_MPORT_5_addr; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_5_mask; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_5_en; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_MPORT_6_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_MPORT_6_addr; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_6_mask; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_6_en; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_MPORT_7_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_MPORT_7_addr; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_7_mask; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_7_en; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_MPORT_8_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_MPORT_8_addr; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_8_mask; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_8_en; // @[RingBuffer.scala 30:16]
  wire [31:0] ram_MPORT_9_data; // @[RingBuffer.scala 30:16]
  wire [3:0] ram_MPORT_9_addr; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_9_mask; // @[RingBuffer.scala 30:16]
  wire  ram_MPORT_9_en; // @[RingBuffer.scala 30:16]
  reg [3:0] outputPtr; // @[Counter.scala 60:40]
  wire  wrap_wrap = outputPtr == 4'h9; // @[Counter.scala 72:24]
  wire [3:0] _wrap_value_T_1 = outputPtr + 4'h1; // @[Counter.scala 76:24]
  assign ram_io_outData_bits_0_MPORT_addr = outputPtr;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_outData_bits_0_MPORT_data = ram[ram_io_outData_bits_0_MPORT_addr]; // @[RingBuffer.scala 30:16]
  `else
  assign ram_io_outData_bits_0_MPORT_data = ram_io_outData_bits_0_MPORT_addr >= 4'ha ? _RAND_1[31:0] :
    ram[ram_io_outData_bits_0_MPORT_addr]; // @[RingBuffer.scala 30:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_inData_bits_0;
  assign ram_MPORT_addr = 4'h0;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_inData_valid;
  assign ram_MPORT_1_data = io_inData_bits_1;
  assign ram_MPORT_1_addr = 4'h1;
  assign ram_MPORT_1_mask = 1'h1;
  assign ram_MPORT_1_en = io_inData_valid;
  assign ram_MPORT_2_data = io_inData_bits_2;
  assign ram_MPORT_2_addr = 4'h2;
  assign ram_MPORT_2_mask = 1'h1;
  assign ram_MPORT_2_en = io_inData_valid;
  assign ram_MPORT_3_data = io_inData_bits_3;
  assign ram_MPORT_3_addr = 4'h3;
  assign ram_MPORT_3_mask = 1'h1;
  assign ram_MPORT_3_en = io_inData_valid;
  assign ram_MPORT_4_data = io_inData_bits_4;
  assign ram_MPORT_4_addr = 4'h4;
  assign ram_MPORT_4_mask = 1'h1;
  assign ram_MPORT_4_en = io_inData_valid;
  assign ram_MPORT_5_data = io_inData_bits_5;
  assign ram_MPORT_5_addr = 4'h5;
  assign ram_MPORT_5_mask = 1'h1;
  assign ram_MPORT_5_en = io_inData_valid;
  assign ram_MPORT_6_data = io_inData_bits_6;
  assign ram_MPORT_6_addr = 4'h6;
  assign ram_MPORT_6_mask = 1'h1;
  assign ram_MPORT_6_en = io_inData_valid;
  assign ram_MPORT_7_data = io_inData_bits_7;
  assign ram_MPORT_7_addr = 4'h7;
  assign ram_MPORT_7_mask = 1'h1;
  assign ram_MPORT_7_en = io_inData_valid;
  assign ram_MPORT_8_data = io_inData_bits_8;
  assign ram_MPORT_8_addr = 4'h8;
  assign ram_MPORT_8_mask = 1'h1;
  assign ram_MPORT_8_en = io_inData_valid;
  assign ram_MPORT_9_data = io_inData_bits_9;
  assign ram_MPORT_9_addr = 4'h9;
  assign ram_MPORT_9_mask = 1'h1;
  assign ram_MPORT_9_en = io_inData_valid;
  assign io_outData_valid = ~io_inData_valid; // @[RingBuffer.scala 41:23]
  assign io_outData_bits_0 = ram_io_outData_bits_0_MPORT_data; // @[RingBuffer.scala 42:22]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[RingBuffer.scala 30:16]
    end
    if(ram_MPORT_1_en & ram_MPORT_1_mask) begin
      ram[ram_MPORT_1_addr] <= ram_MPORT_1_data; // @[RingBuffer.scala 30:16]
    end
    if(ram_MPORT_2_en & ram_MPORT_2_mask) begin
      ram[ram_MPORT_2_addr] <= ram_MPORT_2_data; // @[RingBuffer.scala 30:16]
    end
    if(ram_MPORT_3_en & ram_MPORT_3_mask) begin
      ram[ram_MPORT_3_addr] <= ram_MPORT_3_data; // @[RingBuffer.scala 30:16]
    end
    if(ram_MPORT_4_en & ram_MPORT_4_mask) begin
      ram[ram_MPORT_4_addr] <= ram_MPORT_4_data; // @[RingBuffer.scala 30:16]
    end
    if(ram_MPORT_5_en & ram_MPORT_5_mask) begin
      ram[ram_MPORT_5_addr] <= ram_MPORT_5_data; // @[RingBuffer.scala 30:16]
    end
    if(ram_MPORT_6_en & ram_MPORT_6_mask) begin
      ram[ram_MPORT_6_addr] <= ram_MPORT_6_data; // @[RingBuffer.scala 30:16]
    end
    if(ram_MPORT_7_en & ram_MPORT_7_mask) begin
      ram[ram_MPORT_7_addr] <= ram_MPORT_7_data; // @[RingBuffer.scala 30:16]
    end
    if(ram_MPORT_8_en & ram_MPORT_8_mask) begin
      ram[ram_MPORT_8_addr] <= ram_MPORT_8_data; // @[RingBuffer.scala 30:16]
    end
    if(ram_MPORT_9_en & ram_MPORT_9_mask) begin
      ram[ram_MPORT_9_addr] <= ram_MPORT_9_data; // @[RingBuffer.scala 30:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      outputPtr <= 4'h0; // @[Counter.scala 60:40]
    end else if (io_inData_valid) begin // @[Counter.scala 135:17]
      outputPtr <= 4'h0; // @[Counter.scala 97:11]
    end else if (io_outData_ready) begin // @[Counter.scala 137:24]
      if (wrap_wrap) begin // @[Counter.scala 86:20]
        outputPtr <= 4'h0; // @[Counter.scala 86:28]
      end else begin
        outputPtr <= _wrap_value_T_1; // @[Counter.scala 76:15]
      end
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 10; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  outputPtr = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module LineBuffer(
  input         clock,
  input         reset,
  input         io_inData_valid,
  input  [31:0] io_inData_bits_0,
  input  [31:0] io_inData_bits_1,
  input  [31:0] io_inData_bits_2,
  input  [31:0] io_inData_bits_3,
  input  [31:0] io_inData_bits_4,
  input  [31:0] io_inData_bits_5,
  input  [31:0] io_inData_bits_6,
  input  [31:0] io_inData_bits_7,
  input  [31:0] io_inData_bits_8,
  input  [31:0] io_inData_bits_9,
  output        io_outData_valid,
  output [31:0] io_outData_bits_0,
  output [31:0] io_outData_bits_1,
  output [31:0] io_outData_bits_2,
  output [31:0] io_outData_bits_3,
  output [31:0] io_outData_bits_4,
  output [31:0] io_outData_bits_5,
  output [31:0] io_outData_bits_6,
  output [31:0] io_outData_bits_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  RingBuffer_clock; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_reset; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_io_inData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_inData_bits_0; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_inData_bits_1; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_inData_bits_2; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_inData_bits_3; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_inData_bits_4; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_inData_bits_5; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_inData_bits_6; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_inData_bits_7; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_inData_bits_8; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_inData_bits_9; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_io_outData_ready; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_io_outData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_io_outData_bits_0; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_1_clock; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_1_reset; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_1_io_inData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_inData_bits_0; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_inData_bits_1; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_inData_bits_2; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_inData_bits_3; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_inData_bits_4; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_inData_bits_5; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_inData_bits_6; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_inData_bits_7; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_inData_bits_8; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_inData_bits_9; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_1_io_outData_ready; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_1_io_outData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_1_io_outData_bits_0; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_2_clock; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_2_reset; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_2_io_inData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_inData_bits_0; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_inData_bits_1; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_inData_bits_2; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_inData_bits_3; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_inData_bits_4; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_inData_bits_5; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_inData_bits_6; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_inData_bits_7; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_inData_bits_8; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_inData_bits_9; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_2_io_outData_ready; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_2_io_outData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_2_io_outData_bits_0; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_3_clock; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_3_reset; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_3_io_inData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_inData_bits_0; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_inData_bits_1; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_inData_bits_2; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_inData_bits_3; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_inData_bits_4; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_inData_bits_5; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_inData_bits_6; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_inData_bits_7; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_inData_bits_8; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_inData_bits_9; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_3_io_outData_ready; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_3_io_outData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_3_io_outData_bits_0; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_4_clock; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_4_reset; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_4_io_inData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_inData_bits_0; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_inData_bits_1; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_inData_bits_2; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_inData_bits_3; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_inData_bits_4; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_inData_bits_5; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_inData_bits_6; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_inData_bits_7; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_inData_bits_8; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_inData_bits_9; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_4_io_outData_ready; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_4_io_outData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_4_io_outData_bits_0; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_5_clock; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_5_reset; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_5_io_inData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_inData_bits_0; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_inData_bits_1; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_inData_bits_2; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_inData_bits_3; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_inData_bits_4; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_inData_bits_5; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_inData_bits_6; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_inData_bits_7; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_inData_bits_8; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_inData_bits_9; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_5_io_outData_ready; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_5_io_outData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_5_io_outData_bits_0; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_6_clock; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_6_reset; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_6_io_inData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_inData_bits_0; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_inData_bits_1; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_inData_bits_2; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_inData_bits_3; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_inData_bits_4; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_inData_bits_5; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_inData_bits_6; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_inData_bits_7; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_inData_bits_8; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_inData_bits_9; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_6_io_outData_ready; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_6_io_outData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_6_io_outData_bits_0; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_7_clock; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_7_reset; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_7_io_inData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_inData_bits_0; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_inData_bits_1; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_inData_bits_2; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_inData_bits_3; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_inData_bits_4; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_inData_bits_5; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_inData_bits_6; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_inData_bits_7; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_inData_bits_8; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_inData_bits_9; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_7_io_outData_ready; // @[LineBuffer.scala 27:49]
  wire  RingBuffer_7_io_outData_valid; // @[LineBuffer.scala 27:49]
  wire [31:0] RingBuffer_7_io_outData_bits_0; // @[LineBuffer.scala 27:49]
  wire  _T = ~io_inData_valid; // @[LineBuffer.scala 21:45]
  reg [3:0] _colCntr; // @[Counter.scala 60:40]
  wire  wrap_wrap = _colCntr == 4'h9; // @[Counter.scala 72:24]
  wire [3:0] _wrap_value_T_1 = _colCntr + 4'h1; // @[Counter.scala 76:24]
  wire  colCntrWillWrap = _T & wrap_wrap; // @[Counter.scala 118:17 Counter.scala 118:24]
  reg [2:0] rowCntr; // @[Counter.scala 60:40]
  wire [2:0] _rowCntr_wrap_value_T_1 = rowCntr + 3'h1; // @[Counter.scala 76:24]
  wire  _GEN_5 = 3'h0 == rowCntr; // @[LineBuffer.scala 38:33 LineBuffer.scala 38:33 LineBuffer.scala 31:29]
  wire  _GEN_6 = 3'h1 == rowCntr; // @[LineBuffer.scala 38:33 LineBuffer.scala 38:33 LineBuffer.scala 31:29]
  wire  _GEN_7 = 3'h2 == rowCntr; // @[LineBuffer.scala 38:33 LineBuffer.scala 38:33 LineBuffer.scala 31:29]
  wire  _GEN_8 = 3'h3 == rowCntr; // @[LineBuffer.scala 38:33 LineBuffer.scala 38:33 LineBuffer.scala 31:29]
  wire  _GEN_9 = 3'h4 == rowCntr; // @[LineBuffer.scala 38:33 LineBuffer.scala 38:33 LineBuffer.scala 31:29]
  wire  _GEN_10 = 3'h5 == rowCntr; // @[LineBuffer.scala 38:33 LineBuffer.scala 38:33 LineBuffer.scala 31:29]
  wire  _GEN_11 = 3'h6 == rowCntr; // @[LineBuffer.scala 38:33 LineBuffer.scala 38:33 LineBuffer.scala 31:29]
  wire  _GEN_12 = 3'h7 == rowCntr; // @[LineBuffer.scala 38:33 LineBuffer.scala 38:33 LineBuffer.scala 31:29]
  wire  _GEN_13 = 3'h0 == rowCntr ? 1'h0 : _T; // @[LineBuffer.scala 39:34 LineBuffer.scala 39:34 LineBuffer.scala 33:30]
  wire  _GEN_14 = 3'h1 == rowCntr ? 1'h0 : _T; // @[LineBuffer.scala 39:34 LineBuffer.scala 39:34 LineBuffer.scala 33:30]
  wire  _GEN_15 = 3'h2 == rowCntr ? 1'h0 : _T; // @[LineBuffer.scala 39:34 LineBuffer.scala 39:34 LineBuffer.scala 33:30]
  wire  _GEN_16 = 3'h3 == rowCntr ? 1'h0 : _T; // @[LineBuffer.scala 39:34 LineBuffer.scala 39:34 LineBuffer.scala 33:30]
  wire  _GEN_17 = 3'h4 == rowCntr ? 1'h0 : _T; // @[LineBuffer.scala 39:34 LineBuffer.scala 39:34 LineBuffer.scala 33:30]
  wire  _GEN_18 = 3'h5 == rowCntr ? 1'h0 : _T; // @[LineBuffer.scala 39:34 LineBuffer.scala 39:34 LineBuffer.scala 33:30]
  wire  _GEN_19 = 3'h6 == rowCntr ? 1'h0 : _T; // @[LineBuffer.scala 39:34 LineBuffer.scala 39:34 LineBuffer.scala 33:30]
  wire  _GEN_20 = 3'h7 == rowCntr ? 1'h0 : _T; // @[LineBuffer.scala 39:34 LineBuffer.scala 39:34 LineBuffer.scala 33:30]
  wire [31:0] _GEN_21 = 3'h0 == rowCntr ? io_inData_bits_0 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_22 = 3'h1 == rowCntr ? io_inData_bits_0 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_23 = 3'h2 == rowCntr ? io_inData_bits_0 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_24 = 3'h3 == rowCntr ? io_inData_bits_0 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_25 = 3'h4 == rowCntr ? io_inData_bits_0 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_26 = 3'h5 == rowCntr ? io_inData_bits_0 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_27 = 3'h6 == rowCntr ? io_inData_bits_0 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_28 = 3'h7 == rowCntr ? io_inData_bits_0 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_29 = 3'h0 == rowCntr ? io_inData_bits_1 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_30 = 3'h1 == rowCntr ? io_inData_bits_1 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_31 = 3'h2 == rowCntr ? io_inData_bits_1 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_32 = 3'h3 == rowCntr ? io_inData_bits_1 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_33 = 3'h4 == rowCntr ? io_inData_bits_1 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_34 = 3'h5 == rowCntr ? io_inData_bits_1 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_35 = 3'h6 == rowCntr ? io_inData_bits_1 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_36 = 3'h7 == rowCntr ? io_inData_bits_1 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_37 = 3'h0 == rowCntr ? io_inData_bits_2 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_38 = 3'h1 == rowCntr ? io_inData_bits_2 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_39 = 3'h2 == rowCntr ? io_inData_bits_2 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_40 = 3'h3 == rowCntr ? io_inData_bits_2 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_41 = 3'h4 == rowCntr ? io_inData_bits_2 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_42 = 3'h5 == rowCntr ? io_inData_bits_2 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_43 = 3'h6 == rowCntr ? io_inData_bits_2 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_44 = 3'h7 == rowCntr ? io_inData_bits_2 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_45 = 3'h0 == rowCntr ? io_inData_bits_3 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_46 = 3'h1 == rowCntr ? io_inData_bits_3 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_47 = 3'h2 == rowCntr ? io_inData_bits_3 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_48 = 3'h3 == rowCntr ? io_inData_bits_3 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_49 = 3'h4 == rowCntr ? io_inData_bits_3 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_50 = 3'h5 == rowCntr ? io_inData_bits_3 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_51 = 3'h6 == rowCntr ? io_inData_bits_3 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_52 = 3'h7 == rowCntr ? io_inData_bits_3 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_53 = 3'h0 == rowCntr ? io_inData_bits_4 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_54 = 3'h1 == rowCntr ? io_inData_bits_4 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_55 = 3'h2 == rowCntr ? io_inData_bits_4 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_56 = 3'h3 == rowCntr ? io_inData_bits_4 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_57 = 3'h4 == rowCntr ? io_inData_bits_4 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_58 = 3'h5 == rowCntr ? io_inData_bits_4 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_59 = 3'h6 == rowCntr ? io_inData_bits_4 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_60 = 3'h7 == rowCntr ? io_inData_bits_4 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_61 = 3'h0 == rowCntr ? io_inData_bits_5 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_62 = 3'h1 == rowCntr ? io_inData_bits_5 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_63 = 3'h2 == rowCntr ? io_inData_bits_5 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_64 = 3'h3 == rowCntr ? io_inData_bits_5 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_65 = 3'h4 == rowCntr ? io_inData_bits_5 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_66 = 3'h5 == rowCntr ? io_inData_bits_5 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_67 = 3'h6 == rowCntr ? io_inData_bits_5 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_68 = 3'h7 == rowCntr ? io_inData_bits_5 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_69 = 3'h0 == rowCntr ? io_inData_bits_6 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_70 = 3'h1 == rowCntr ? io_inData_bits_6 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_71 = 3'h2 == rowCntr ? io_inData_bits_6 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_72 = 3'h3 == rowCntr ? io_inData_bits_6 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_73 = 3'h4 == rowCntr ? io_inData_bits_6 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_74 = 3'h5 == rowCntr ? io_inData_bits_6 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_75 = 3'h6 == rowCntr ? io_inData_bits_6 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_76 = 3'h7 == rowCntr ? io_inData_bits_6 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_77 = 3'h0 == rowCntr ? io_inData_bits_7 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_78 = 3'h1 == rowCntr ? io_inData_bits_7 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_79 = 3'h2 == rowCntr ? io_inData_bits_7 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_80 = 3'h3 == rowCntr ? io_inData_bits_7 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_81 = 3'h4 == rowCntr ? io_inData_bits_7 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_82 = 3'h5 == rowCntr ? io_inData_bits_7 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_83 = 3'h6 == rowCntr ? io_inData_bits_7 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_84 = 3'h7 == rowCntr ? io_inData_bits_7 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_85 = 3'h0 == rowCntr ? io_inData_bits_8 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_86 = 3'h1 == rowCntr ? io_inData_bits_8 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_87 = 3'h2 == rowCntr ? io_inData_bits_8 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_88 = 3'h3 == rowCntr ? io_inData_bits_8 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_89 = 3'h4 == rowCntr ? io_inData_bits_8 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_90 = 3'h5 == rowCntr ? io_inData_bits_8 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_91 = 3'h6 == rowCntr ? io_inData_bits_8 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_92 = 3'h7 == rowCntr ? io_inData_bits_8 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_93 = 3'h0 == rowCntr ? io_inData_bits_9 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_94 = 3'h1 == rowCntr ? io_inData_bits_9 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_95 = 3'h2 == rowCntr ? io_inData_bits_9 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_96 = 3'h3 == rowCntr ? io_inData_bits_9 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_97 = 3'h4 == rowCntr ? io_inData_bits_9 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_98 = 3'h5 == rowCntr ? io_inData_bits_9 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_99 = 3'h6 == rowCntr ? io_inData_bits_9 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [31:0] _GEN_100 = 3'h7 == rowCntr ? io_inData_bits_9 : 32'h0; // @[LineBuffer.scala 41:37 LineBuffer.scala 41:37 LineBuffer.scala 32:31]
  wire [4:0] _idx_T = 1'h0 * 4'h8; // @[LineBuffer.scala 83:30]
  wire [4:0] _GEN_773 = {{2'd0}, rowCntr}; // @[LineBuffer.scala 83:49]
  wire [5:0] _idx_T_1 = _idx_T + _GEN_773; // @[LineBuffer.scala 83:49]
  wire  rings_0_outData_valid = RingBuffer_io_outData_valid; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] rings_0_outData_bits_0 = RingBuffer_io_outData_bits_0; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] _io_outData_bits_T = rings_0_outData_valid ? rings_0_outData_bits_0 : 32'h0; // @[LineBuffer.scala 84:32]
  wire [2:0] _GEN_198 = 6'h1 == _idx_T_1 ? 3'h1 : 3'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_199 = 6'h2 == _idx_T_1 ? 3'h2 : _GEN_198; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_200 = 6'h3 == _idx_T_1 ? 3'h3 : _GEN_199; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_201 = 6'h4 == _idx_T_1 ? 3'h4 : _GEN_200; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_202 = 6'h5 == _idx_T_1 ? 3'h5 : _GEN_201; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_203 = 6'h6 == _idx_T_1 ? 3'h6 : _GEN_202; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_204 = 6'h7 == _idx_T_1 ? 3'h7 : _GEN_203; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_205 = 6'h8 == _idx_T_1 ? 3'h7 : _GEN_204; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_206 = 6'h9 == _idx_T_1 ? 3'h0 : _GEN_205; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_207 = 6'ha == _idx_T_1 ? 3'h1 : _GEN_206; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_208 = 6'hb == _idx_T_1 ? 3'h2 : _GEN_207; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_209 = 6'hc == _idx_T_1 ? 3'h3 : _GEN_208; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_210 = 6'hd == _idx_T_1 ? 3'h4 : _GEN_209; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_211 = 6'he == _idx_T_1 ? 3'h5 : _GEN_210; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_212 = 6'hf == _idx_T_1 ? 3'h6 : _GEN_211; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_213 = 6'h10 == _idx_T_1 ? 3'h6 : _GEN_212; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_214 = 6'h11 == _idx_T_1 ? 3'h7 : _GEN_213; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_215 = 6'h12 == _idx_T_1 ? 3'h0 : _GEN_214; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_216 = 6'h13 == _idx_T_1 ? 3'h1 : _GEN_215; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_217 = 6'h14 == _idx_T_1 ? 3'h2 : _GEN_216; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_218 = 6'h15 == _idx_T_1 ? 3'h3 : _GEN_217; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_219 = 6'h16 == _idx_T_1 ? 3'h4 : _GEN_218; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_220 = 6'h17 == _idx_T_1 ? 3'h5 : _GEN_219; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_221 = 6'h18 == _idx_T_1 ? 3'h5 : _GEN_220; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_222 = 6'h19 == _idx_T_1 ? 3'h6 : _GEN_221; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_223 = 6'h1a == _idx_T_1 ? 3'h7 : _GEN_222; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_224 = 6'h1b == _idx_T_1 ? 3'h0 : _GEN_223; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_225 = 6'h1c == _idx_T_1 ? 3'h1 : _GEN_224; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_226 = 6'h1d == _idx_T_1 ? 3'h2 : _GEN_225; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_227 = 6'h1e == _idx_T_1 ? 3'h3 : _GEN_226; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_228 = 6'h1f == _idx_T_1 ? 3'h4 : _GEN_227; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_229 = 6'h20 == _idx_T_1 ? 3'h4 : _GEN_228; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_230 = 6'h21 == _idx_T_1 ? 3'h5 : _GEN_229; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_231 = 6'h22 == _idx_T_1 ? 3'h6 : _GEN_230; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_232 = 6'h23 == _idx_T_1 ? 3'h7 : _GEN_231; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_233 = 6'h24 == _idx_T_1 ? 3'h0 : _GEN_232; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_234 = 6'h25 == _idx_T_1 ? 3'h1 : _GEN_233; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_235 = 6'h26 == _idx_T_1 ? 3'h2 : _GEN_234; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_236 = 6'h27 == _idx_T_1 ? 3'h3 : _GEN_235; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_237 = 6'h28 == _idx_T_1 ? 3'h3 : _GEN_236; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_238 = 6'h29 == _idx_T_1 ? 3'h4 : _GEN_237; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_239 = 6'h2a == _idx_T_1 ? 3'h5 : _GEN_238; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_240 = 6'h2b == _idx_T_1 ? 3'h6 : _GEN_239; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_241 = 6'h2c == _idx_T_1 ? 3'h7 : _GEN_240; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_242 = 6'h2d == _idx_T_1 ? 3'h0 : _GEN_241; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_243 = 6'h2e == _idx_T_1 ? 3'h1 : _GEN_242; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_244 = 6'h2f == _idx_T_1 ? 3'h2 : _GEN_243; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_245 = 6'h30 == _idx_T_1 ? 3'h2 : _GEN_244; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_246 = 6'h31 == _idx_T_1 ? 3'h3 : _GEN_245; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_247 = 6'h32 == _idx_T_1 ? 3'h4 : _GEN_246; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_248 = 6'h33 == _idx_T_1 ? 3'h5 : _GEN_247; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_249 = 6'h34 == _idx_T_1 ? 3'h6 : _GEN_248; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_250 = 6'h35 == _idx_T_1 ? 3'h7 : _GEN_249; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_251 = 6'h36 == _idx_T_1 ? 3'h0 : _GEN_250; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_252 = 6'h37 == _idx_T_1 ? 3'h1 : _GEN_251; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_253 = 6'h38 == _idx_T_1 ? 3'h1 : _GEN_252; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_254 = 6'h39 == _idx_T_1 ? 3'h2 : _GEN_253; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_255 = 6'h3a == _idx_T_1 ? 3'h3 : _GEN_254; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_256 = 6'h3b == _idx_T_1 ? 3'h4 : _GEN_255; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_257 = 6'h3c == _idx_T_1 ? 3'h5 : _GEN_256; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_258 = 6'h3d == _idx_T_1 ? 3'h6 : _GEN_257; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_259 = 6'h3e == _idx_T_1 ? 3'h7 : _GEN_258; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_260 = 6'h3f == _idx_T_1 ? 3'h0 : _GEN_259; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_261 = 3'h0 == _GEN_260 ? _io_outData_bits_T : 32'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26 LineBuffer.scala 29:24]
  wire [31:0] _GEN_262 = 3'h1 == _GEN_260 ? _io_outData_bits_T : 32'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26 LineBuffer.scala 29:24]
  wire [31:0] _GEN_263 = 3'h2 == _GEN_260 ? _io_outData_bits_T : 32'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26 LineBuffer.scala 29:24]
  wire [31:0] _GEN_264 = 3'h3 == _GEN_260 ? _io_outData_bits_T : 32'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26 LineBuffer.scala 29:24]
  wire [31:0] _GEN_265 = 3'h4 == _GEN_260 ? _io_outData_bits_T : 32'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26 LineBuffer.scala 29:24]
  wire [31:0] _GEN_266 = 3'h5 == _GEN_260 ? _io_outData_bits_T : 32'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26 LineBuffer.scala 29:24]
  wire [31:0] _GEN_267 = 3'h6 == _GEN_260 ? _io_outData_bits_T : 32'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26 LineBuffer.scala 29:24]
  wire [31:0] _GEN_268 = 3'h7 == _GEN_260 ? _io_outData_bits_T : 32'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26 LineBuffer.scala 29:24]
  wire [4:0] _idx_T_2 = 1'h1 * 4'h8; // @[LineBuffer.scala 83:30]
  wire [5:0] _idx_T_3 = _idx_T_2 + _GEN_773; // @[LineBuffer.scala 83:49]
  wire  rings_1_outData_valid = RingBuffer_1_io_outData_valid; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] rings_1_outData_bits_0 = RingBuffer_1_io_outData_bits_0; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] _io_outData_bits_T_1 = rings_1_outData_valid ? rings_1_outData_bits_0 : 32'h0; // @[LineBuffer.scala 84:32]
  wire [2:0] _GEN_270 = 6'h1 == _idx_T_3 ? 3'h1 : 3'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_271 = 6'h2 == _idx_T_3 ? 3'h2 : _GEN_270; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_272 = 6'h3 == _idx_T_3 ? 3'h3 : _GEN_271; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_273 = 6'h4 == _idx_T_3 ? 3'h4 : _GEN_272; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_274 = 6'h5 == _idx_T_3 ? 3'h5 : _GEN_273; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_275 = 6'h6 == _idx_T_3 ? 3'h6 : _GEN_274; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_276 = 6'h7 == _idx_T_3 ? 3'h7 : _GEN_275; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_277 = 6'h8 == _idx_T_3 ? 3'h7 : _GEN_276; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_278 = 6'h9 == _idx_T_3 ? 3'h0 : _GEN_277; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_279 = 6'ha == _idx_T_3 ? 3'h1 : _GEN_278; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_280 = 6'hb == _idx_T_3 ? 3'h2 : _GEN_279; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_281 = 6'hc == _idx_T_3 ? 3'h3 : _GEN_280; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_282 = 6'hd == _idx_T_3 ? 3'h4 : _GEN_281; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_283 = 6'he == _idx_T_3 ? 3'h5 : _GEN_282; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_284 = 6'hf == _idx_T_3 ? 3'h6 : _GEN_283; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_285 = 6'h10 == _idx_T_3 ? 3'h6 : _GEN_284; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_286 = 6'h11 == _idx_T_3 ? 3'h7 : _GEN_285; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_287 = 6'h12 == _idx_T_3 ? 3'h0 : _GEN_286; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_288 = 6'h13 == _idx_T_3 ? 3'h1 : _GEN_287; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_289 = 6'h14 == _idx_T_3 ? 3'h2 : _GEN_288; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_290 = 6'h15 == _idx_T_3 ? 3'h3 : _GEN_289; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_291 = 6'h16 == _idx_T_3 ? 3'h4 : _GEN_290; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_292 = 6'h17 == _idx_T_3 ? 3'h5 : _GEN_291; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_293 = 6'h18 == _idx_T_3 ? 3'h5 : _GEN_292; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_294 = 6'h19 == _idx_T_3 ? 3'h6 : _GEN_293; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_295 = 6'h1a == _idx_T_3 ? 3'h7 : _GEN_294; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_296 = 6'h1b == _idx_T_3 ? 3'h0 : _GEN_295; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_297 = 6'h1c == _idx_T_3 ? 3'h1 : _GEN_296; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_298 = 6'h1d == _idx_T_3 ? 3'h2 : _GEN_297; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_299 = 6'h1e == _idx_T_3 ? 3'h3 : _GEN_298; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_300 = 6'h1f == _idx_T_3 ? 3'h4 : _GEN_299; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_301 = 6'h20 == _idx_T_3 ? 3'h4 : _GEN_300; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_302 = 6'h21 == _idx_T_3 ? 3'h5 : _GEN_301; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_303 = 6'h22 == _idx_T_3 ? 3'h6 : _GEN_302; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_304 = 6'h23 == _idx_T_3 ? 3'h7 : _GEN_303; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_305 = 6'h24 == _idx_T_3 ? 3'h0 : _GEN_304; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_306 = 6'h25 == _idx_T_3 ? 3'h1 : _GEN_305; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_307 = 6'h26 == _idx_T_3 ? 3'h2 : _GEN_306; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_308 = 6'h27 == _idx_T_3 ? 3'h3 : _GEN_307; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_309 = 6'h28 == _idx_T_3 ? 3'h3 : _GEN_308; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_310 = 6'h29 == _idx_T_3 ? 3'h4 : _GEN_309; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_311 = 6'h2a == _idx_T_3 ? 3'h5 : _GEN_310; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_312 = 6'h2b == _idx_T_3 ? 3'h6 : _GEN_311; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_313 = 6'h2c == _idx_T_3 ? 3'h7 : _GEN_312; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_314 = 6'h2d == _idx_T_3 ? 3'h0 : _GEN_313; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_315 = 6'h2e == _idx_T_3 ? 3'h1 : _GEN_314; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_316 = 6'h2f == _idx_T_3 ? 3'h2 : _GEN_315; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_317 = 6'h30 == _idx_T_3 ? 3'h2 : _GEN_316; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_318 = 6'h31 == _idx_T_3 ? 3'h3 : _GEN_317; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_319 = 6'h32 == _idx_T_3 ? 3'h4 : _GEN_318; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_320 = 6'h33 == _idx_T_3 ? 3'h5 : _GEN_319; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_321 = 6'h34 == _idx_T_3 ? 3'h6 : _GEN_320; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_322 = 6'h35 == _idx_T_3 ? 3'h7 : _GEN_321; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_323 = 6'h36 == _idx_T_3 ? 3'h0 : _GEN_322; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_324 = 6'h37 == _idx_T_3 ? 3'h1 : _GEN_323; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_325 = 6'h38 == _idx_T_3 ? 3'h1 : _GEN_324; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_326 = 6'h39 == _idx_T_3 ? 3'h2 : _GEN_325; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_327 = 6'h3a == _idx_T_3 ? 3'h3 : _GEN_326; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_328 = 6'h3b == _idx_T_3 ? 3'h4 : _GEN_327; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_329 = 6'h3c == _idx_T_3 ? 3'h5 : _GEN_328; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_330 = 6'h3d == _idx_T_3 ? 3'h6 : _GEN_329; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_331 = 6'h3e == _idx_T_3 ? 3'h7 : _GEN_330; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_332 = 6'h3f == _idx_T_3 ? 3'h0 : _GEN_331; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_333 = 3'h0 == _GEN_332 ? _io_outData_bits_T_1 : _GEN_261; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_334 = 3'h1 == _GEN_332 ? _io_outData_bits_T_1 : _GEN_262; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_335 = 3'h2 == _GEN_332 ? _io_outData_bits_T_1 : _GEN_263; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_336 = 3'h3 == _GEN_332 ? _io_outData_bits_T_1 : _GEN_264; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_337 = 3'h4 == _GEN_332 ? _io_outData_bits_T_1 : _GEN_265; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_338 = 3'h5 == _GEN_332 ? _io_outData_bits_T_1 : _GEN_266; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_339 = 3'h6 == _GEN_332 ? _io_outData_bits_T_1 : _GEN_267; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_340 = 3'h7 == _GEN_332 ? _io_outData_bits_T_1 : _GEN_268; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [5:0] _idx_T_4 = 2'h2 * 4'h8; // @[LineBuffer.scala 83:30]
  wire [5:0] _GEN_775 = {{3'd0}, rowCntr}; // @[LineBuffer.scala 83:49]
  wire [6:0] _idx_T_5 = _idx_T_4 + _GEN_775; // @[LineBuffer.scala 83:49]
  wire  rings_2_outData_valid = RingBuffer_2_io_outData_valid; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] rings_2_outData_bits_0 = RingBuffer_2_io_outData_bits_0; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] _io_outData_bits_T_2 = rings_2_outData_valid ? rings_2_outData_bits_0 : 32'h0; // @[LineBuffer.scala 84:32]
  wire [2:0] _GEN_342 = 6'h1 == _idx_T_5[5:0] ? 3'h1 : 3'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_343 = 6'h2 == _idx_T_5[5:0] ? 3'h2 : _GEN_342; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_344 = 6'h3 == _idx_T_5[5:0] ? 3'h3 : _GEN_343; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_345 = 6'h4 == _idx_T_5[5:0] ? 3'h4 : _GEN_344; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_346 = 6'h5 == _idx_T_5[5:0] ? 3'h5 : _GEN_345; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_347 = 6'h6 == _idx_T_5[5:0] ? 3'h6 : _GEN_346; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_348 = 6'h7 == _idx_T_5[5:0] ? 3'h7 : _GEN_347; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_349 = 6'h8 == _idx_T_5[5:0] ? 3'h7 : _GEN_348; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_350 = 6'h9 == _idx_T_5[5:0] ? 3'h0 : _GEN_349; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_351 = 6'ha == _idx_T_5[5:0] ? 3'h1 : _GEN_350; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_352 = 6'hb == _idx_T_5[5:0] ? 3'h2 : _GEN_351; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_353 = 6'hc == _idx_T_5[5:0] ? 3'h3 : _GEN_352; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_354 = 6'hd == _idx_T_5[5:0] ? 3'h4 : _GEN_353; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_355 = 6'he == _idx_T_5[5:0] ? 3'h5 : _GEN_354; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_356 = 6'hf == _idx_T_5[5:0] ? 3'h6 : _GEN_355; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_357 = 6'h10 == _idx_T_5[5:0] ? 3'h6 : _GEN_356; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_358 = 6'h11 == _idx_T_5[5:0] ? 3'h7 : _GEN_357; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_359 = 6'h12 == _idx_T_5[5:0] ? 3'h0 : _GEN_358; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_360 = 6'h13 == _idx_T_5[5:0] ? 3'h1 : _GEN_359; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_361 = 6'h14 == _idx_T_5[5:0] ? 3'h2 : _GEN_360; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_362 = 6'h15 == _idx_T_5[5:0] ? 3'h3 : _GEN_361; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_363 = 6'h16 == _idx_T_5[5:0] ? 3'h4 : _GEN_362; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_364 = 6'h17 == _idx_T_5[5:0] ? 3'h5 : _GEN_363; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_365 = 6'h18 == _idx_T_5[5:0] ? 3'h5 : _GEN_364; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_366 = 6'h19 == _idx_T_5[5:0] ? 3'h6 : _GEN_365; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_367 = 6'h1a == _idx_T_5[5:0] ? 3'h7 : _GEN_366; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_368 = 6'h1b == _idx_T_5[5:0] ? 3'h0 : _GEN_367; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_369 = 6'h1c == _idx_T_5[5:0] ? 3'h1 : _GEN_368; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_370 = 6'h1d == _idx_T_5[5:0] ? 3'h2 : _GEN_369; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_371 = 6'h1e == _idx_T_5[5:0] ? 3'h3 : _GEN_370; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_372 = 6'h1f == _idx_T_5[5:0] ? 3'h4 : _GEN_371; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_373 = 6'h20 == _idx_T_5[5:0] ? 3'h4 : _GEN_372; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_374 = 6'h21 == _idx_T_5[5:0] ? 3'h5 : _GEN_373; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_375 = 6'h22 == _idx_T_5[5:0] ? 3'h6 : _GEN_374; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_376 = 6'h23 == _idx_T_5[5:0] ? 3'h7 : _GEN_375; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_377 = 6'h24 == _idx_T_5[5:0] ? 3'h0 : _GEN_376; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_378 = 6'h25 == _idx_T_5[5:0] ? 3'h1 : _GEN_377; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_379 = 6'h26 == _idx_T_5[5:0] ? 3'h2 : _GEN_378; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_380 = 6'h27 == _idx_T_5[5:0] ? 3'h3 : _GEN_379; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_381 = 6'h28 == _idx_T_5[5:0] ? 3'h3 : _GEN_380; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_382 = 6'h29 == _idx_T_5[5:0] ? 3'h4 : _GEN_381; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_383 = 6'h2a == _idx_T_5[5:0] ? 3'h5 : _GEN_382; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_384 = 6'h2b == _idx_T_5[5:0] ? 3'h6 : _GEN_383; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_385 = 6'h2c == _idx_T_5[5:0] ? 3'h7 : _GEN_384; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_386 = 6'h2d == _idx_T_5[5:0] ? 3'h0 : _GEN_385; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_387 = 6'h2e == _idx_T_5[5:0] ? 3'h1 : _GEN_386; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_388 = 6'h2f == _idx_T_5[5:0] ? 3'h2 : _GEN_387; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_389 = 6'h30 == _idx_T_5[5:0] ? 3'h2 : _GEN_388; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_390 = 6'h31 == _idx_T_5[5:0] ? 3'h3 : _GEN_389; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_391 = 6'h32 == _idx_T_5[5:0] ? 3'h4 : _GEN_390; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_392 = 6'h33 == _idx_T_5[5:0] ? 3'h5 : _GEN_391; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_393 = 6'h34 == _idx_T_5[5:0] ? 3'h6 : _GEN_392; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_394 = 6'h35 == _idx_T_5[5:0] ? 3'h7 : _GEN_393; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_395 = 6'h36 == _idx_T_5[5:0] ? 3'h0 : _GEN_394; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_396 = 6'h37 == _idx_T_5[5:0] ? 3'h1 : _GEN_395; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_397 = 6'h38 == _idx_T_5[5:0] ? 3'h1 : _GEN_396; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_398 = 6'h39 == _idx_T_5[5:0] ? 3'h2 : _GEN_397; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_399 = 6'h3a == _idx_T_5[5:0] ? 3'h3 : _GEN_398; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_400 = 6'h3b == _idx_T_5[5:0] ? 3'h4 : _GEN_399; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_401 = 6'h3c == _idx_T_5[5:0] ? 3'h5 : _GEN_400; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_402 = 6'h3d == _idx_T_5[5:0] ? 3'h6 : _GEN_401; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_403 = 6'h3e == _idx_T_5[5:0] ? 3'h7 : _GEN_402; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_404 = 6'h3f == _idx_T_5[5:0] ? 3'h0 : _GEN_403; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_405 = 3'h0 == _GEN_404 ? _io_outData_bits_T_2 : _GEN_333; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_406 = 3'h1 == _GEN_404 ? _io_outData_bits_T_2 : _GEN_334; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_407 = 3'h2 == _GEN_404 ? _io_outData_bits_T_2 : _GEN_335; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_408 = 3'h3 == _GEN_404 ? _io_outData_bits_T_2 : _GEN_336; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_409 = 3'h4 == _GEN_404 ? _io_outData_bits_T_2 : _GEN_337; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_410 = 3'h5 == _GEN_404 ? _io_outData_bits_T_2 : _GEN_338; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_411 = 3'h6 == _GEN_404 ? _io_outData_bits_T_2 : _GEN_339; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_412 = 3'h7 == _GEN_404 ? _io_outData_bits_T_2 : _GEN_340; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [5:0] _idx_T_7 = 2'h3 * 4'h8; // @[LineBuffer.scala 83:30]
  wire [6:0] _idx_T_8 = _idx_T_7 + _GEN_775; // @[LineBuffer.scala 83:49]
  wire  rings_3_outData_valid = RingBuffer_3_io_outData_valid; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] rings_3_outData_bits_0 = RingBuffer_3_io_outData_bits_0; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] _io_outData_bits_T_3 = rings_3_outData_valid ? rings_3_outData_bits_0 : 32'h0; // @[LineBuffer.scala 84:32]
  wire [2:0] _GEN_414 = 6'h1 == _idx_T_8[5:0] ? 3'h1 : 3'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_415 = 6'h2 == _idx_T_8[5:0] ? 3'h2 : _GEN_414; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_416 = 6'h3 == _idx_T_8[5:0] ? 3'h3 : _GEN_415; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_417 = 6'h4 == _idx_T_8[5:0] ? 3'h4 : _GEN_416; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_418 = 6'h5 == _idx_T_8[5:0] ? 3'h5 : _GEN_417; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_419 = 6'h6 == _idx_T_8[5:0] ? 3'h6 : _GEN_418; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_420 = 6'h7 == _idx_T_8[5:0] ? 3'h7 : _GEN_419; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_421 = 6'h8 == _idx_T_8[5:0] ? 3'h7 : _GEN_420; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_422 = 6'h9 == _idx_T_8[5:0] ? 3'h0 : _GEN_421; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_423 = 6'ha == _idx_T_8[5:0] ? 3'h1 : _GEN_422; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_424 = 6'hb == _idx_T_8[5:0] ? 3'h2 : _GEN_423; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_425 = 6'hc == _idx_T_8[5:0] ? 3'h3 : _GEN_424; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_426 = 6'hd == _idx_T_8[5:0] ? 3'h4 : _GEN_425; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_427 = 6'he == _idx_T_8[5:0] ? 3'h5 : _GEN_426; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_428 = 6'hf == _idx_T_8[5:0] ? 3'h6 : _GEN_427; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_429 = 6'h10 == _idx_T_8[5:0] ? 3'h6 : _GEN_428; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_430 = 6'h11 == _idx_T_8[5:0] ? 3'h7 : _GEN_429; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_431 = 6'h12 == _idx_T_8[5:0] ? 3'h0 : _GEN_430; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_432 = 6'h13 == _idx_T_8[5:0] ? 3'h1 : _GEN_431; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_433 = 6'h14 == _idx_T_8[5:0] ? 3'h2 : _GEN_432; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_434 = 6'h15 == _idx_T_8[5:0] ? 3'h3 : _GEN_433; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_435 = 6'h16 == _idx_T_8[5:0] ? 3'h4 : _GEN_434; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_436 = 6'h17 == _idx_T_8[5:0] ? 3'h5 : _GEN_435; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_437 = 6'h18 == _idx_T_8[5:0] ? 3'h5 : _GEN_436; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_438 = 6'h19 == _idx_T_8[5:0] ? 3'h6 : _GEN_437; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_439 = 6'h1a == _idx_T_8[5:0] ? 3'h7 : _GEN_438; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_440 = 6'h1b == _idx_T_8[5:0] ? 3'h0 : _GEN_439; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_441 = 6'h1c == _idx_T_8[5:0] ? 3'h1 : _GEN_440; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_442 = 6'h1d == _idx_T_8[5:0] ? 3'h2 : _GEN_441; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_443 = 6'h1e == _idx_T_8[5:0] ? 3'h3 : _GEN_442; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_444 = 6'h1f == _idx_T_8[5:0] ? 3'h4 : _GEN_443; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_445 = 6'h20 == _idx_T_8[5:0] ? 3'h4 : _GEN_444; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_446 = 6'h21 == _idx_T_8[5:0] ? 3'h5 : _GEN_445; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_447 = 6'h22 == _idx_T_8[5:0] ? 3'h6 : _GEN_446; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_448 = 6'h23 == _idx_T_8[5:0] ? 3'h7 : _GEN_447; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_449 = 6'h24 == _idx_T_8[5:0] ? 3'h0 : _GEN_448; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_450 = 6'h25 == _idx_T_8[5:0] ? 3'h1 : _GEN_449; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_451 = 6'h26 == _idx_T_8[5:0] ? 3'h2 : _GEN_450; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_452 = 6'h27 == _idx_T_8[5:0] ? 3'h3 : _GEN_451; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_453 = 6'h28 == _idx_T_8[5:0] ? 3'h3 : _GEN_452; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_454 = 6'h29 == _idx_T_8[5:0] ? 3'h4 : _GEN_453; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_455 = 6'h2a == _idx_T_8[5:0] ? 3'h5 : _GEN_454; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_456 = 6'h2b == _idx_T_8[5:0] ? 3'h6 : _GEN_455; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_457 = 6'h2c == _idx_T_8[5:0] ? 3'h7 : _GEN_456; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_458 = 6'h2d == _idx_T_8[5:0] ? 3'h0 : _GEN_457; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_459 = 6'h2e == _idx_T_8[5:0] ? 3'h1 : _GEN_458; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_460 = 6'h2f == _idx_T_8[5:0] ? 3'h2 : _GEN_459; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_461 = 6'h30 == _idx_T_8[5:0] ? 3'h2 : _GEN_460; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_462 = 6'h31 == _idx_T_8[5:0] ? 3'h3 : _GEN_461; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_463 = 6'h32 == _idx_T_8[5:0] ? 3'h4 : _GEN_462; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_464 = 6'h33 == _idx_T_8[5:0] ? 3'h5 : _GEN_463; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_465 = 6'h34 == _idx_T_8[5:0] ? 3'h6 : _GEN_464; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_466 = 6'h35 == _idx_T_8[5:0] ? 3'h7 : _GEN_465; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_467 = 6'h36 == _idx_T_8[5:0] ? 3'h0 : _GEN_466; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_468 = 6'h37 == _idx_T_8[5:0] ? 3'h1 : _GEN_467; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_469 = 6'h38 == _idx_T_8[5:0] ? 3'h1 : _GEN_468; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_470 = 6'h39 == _idx_T_8[5:0] ? 3'h2 : _GEN_469; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_471 = 6'h3a == _idx_T_8[5:0] ? 3'h3 : _GEN_470; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_472 = 6'h3b == _idx_T_8[5:0] ? 3'h4 : _GEN_471; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_473 = 6'h3c == _idx_T_8[5:0] ? 3'h5 : _GEN_472; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_474 = 6'h3d == _idx_T_8[5:0] ? 3'h6 : _GEN_473; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_475 = 6'h3e == _idx_T_8[5:0] ? 3'h7 : _GEN_474; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_476 = 6'h3f == _idx_T_8[5:0] ? 3'h0 : _GEN_475; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_477 = 3'h0 == _GEN_476 ? _io_outData_bits_T_3 : _GEN_405; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_478 = 3'h1 == _GEN_476 ? _io_outData_bits_T_3 : _GEN_406; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_479 = 3'h2 == _GEN_476 ? _io_outData_bits_T_3 : _GEN_407; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_480 = 3'h3 == _GEN_476 ? _io_outData_bits_T_3 : _GEN_408; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_481 = 3'h4 == _GEN_476 ? _io_outData_bits_T_3 : _GEN_409; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_482 = 3'h5 == _GEN_476 ? _io_outData_bits_T_3 : _GEN_410; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_483 = 3'h6 == _GEN_476 ? _io_outData_bits_T_3 : _GEN_411; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_484 = 3'h7 == _GEN_476 ? _io_outData_bits_T_3 : _GEN_412; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [6:0] _idx_T_10 = 3'h4 * 4'h8; // @[LineBuffer.scala 83:30]
  wire [6:0] _GEN_777 = {{4'd0}, rowCntr}; // @[LineBuffer.scala 83:49]
  wire [7:0] _idx_T_11 = _idx_T_10 + _GEN_777; // @[LineBuffer.scala 83:49]
  wire  rings_4_outData_valid = RingBuffer_4_io_outData_valid; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] rings_4_outData_bits_0 = RingBuffer_4_io_outData_bits_0; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] _io_outData_bits_T_4 = rings_4_outData_valid ? rings_4_outData_bits_0 : 32'h0; // @[LineBuffer.scala 84:32]
  wire [2:0] _GEN_486 = 6'h1 == _idx_T_11[5:0] ? 3'h1 : 3'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_487 = 6'h2 == _idx_T_11[5:0] ? 3'h2 : _GEN_486; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_488 = 6'h3 == _idx_T_11[5:0] ? 3'h3 : _GEN_487; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_489 = 6'h4 == _idx_T_11[5:0] ? 3'h4 : _GEN_488; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_490 = 6'h5 == _idx_T_11[5:0] ? 3'h5 : _GEN_489; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_491 = 6'h6 == _idx_T_11[5:0] ? 3'h6 : _GEN_490; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_492 = 6'h7 == _idx_T_11[5:0] ? 3'h7 : _GEN_491; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_493 = 6'h8 == _idx_T_11[5:0] ? 3'h7 : _GEN_492; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_494 = 6'h9 == _idx_T_11[5:0] ? 3'h0 : _GEN_493; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_495 = 6'ha == _idx_T_11[5:0] ? 3'h1 : _GEN_494; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_496 = 6'hb == _idx_T_11[5:0] ? 3'h2 : _GEN_495; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_497 = 6'hc == _idx_T_11[5:0] ? 3'h3 : _GEN_496; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_498 = 6'hd == _idx_T_11[5:0] ? 3'h4 : _GEN_497; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_499 = 6'he == _idx_T_11[5:0] ? 3'h5 : _GEN_498; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_500 = 6'hf == _idx_T_11[5:0] ? 3'h6 : _GEN_499; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_501 = 6'h10 == _idx_T_11[5:0] ? 3'h6 : _GEN_500; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_502 = 6'h11 == _idx_T_11[5:0] ? 3'h7 : _GEN_501; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_503 = 6'h12 == _idx_T_11[5:0] ? 3'h0 : _GEN_502; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_504 = 6'h13 == _idx_T_11[5:0] ? 3'h1 : _GEN_503; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_505 = 6'h14 == _idx_T_11[5:0] ? 3'h2 : _GEN_504; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_506 = 6'h15 == _idx_T_11[5:0] ? 3'h3 : _GEN_505; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_507 = 6'h16 == _idx_T_11[5:0] ? 3'h4 : _GEN_506; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_508 = 6'h17 == _idx_T_11[5:0] ? 3'h5 : _GEN_507; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_509 = 6'h18 == _idx_T_11[5:0] ? 3'h5 : _GEN_508; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_510 = 6'h19 == _idx_T_11[5:0] ? 3'h6 : _GEN_509; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_511 = 6'h1a == _idx_T_11[5:0] ? 3'h7 : _GEN_510; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_512 = 6'h1b == _idx_T_11[5:0] ? 3'h0 : _GEN_511; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_513 = 6'h1c == _idx_T_11[5:0] ? 3'h1 : _GEN_512; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_514 = 6'h1d == _idx_T_11[5:0] ? 3'h2 : _GEN_513; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_515 = 6'h1e == _idx_T_11[5:0] ? 3'h3 : _GEN_514; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_516 = 6'h1f == _idx_T_11[5:0] ? 3'h4 : _GEN_515; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_517 = 6'h20 == _idx_T_11[5:0] ? 3'h4 : _GEN_516; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_518 = 6'h21 == _idx_T_11[5:0] ? 3'h5 : _GEN_517; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_519 = 6'h22 == _idx_T_11[5:0] ? 3'h6 : _GEN_518; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_520 = 6'h23 == _idx_T_11[5:0] ? 3'h7 : _GEN_519; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_521 = 6'h24 == _idx_T_11[5:0] ? 3'h0 : _GEN_520; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_522 = 6'h25 == _idx_T_11[5:0] ? 3'h1 : _GEN_521; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_523 = 6'h26 == _idx_T_11[5:0] ? 3'h2 : _GEN_522; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_524 = 6'h27 == _idx_T_11[5:0] ? 3'h3 : _GEN_523; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_525 = 6'h28 == _idx_T_11[5:0] ? 3'h3 : _GEN_524; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_526 = 6'h29 == _idx_T_11[5:0] ? 3'h4 : _GEN_525; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_527 = 6'h2a == _idx_T_11[5:0] ? 3'h5 : _GEN_526; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_528 = 6'h2b == _idx_T_11[5:0] ? 3'h6 : _GEN_527; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_529 = 6'h2c == _idx_T_11[5:0] ? 3'h7 : _GEN_528; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_530 = 6'h2d == _idx_T_11[5:0] ? 3'h0 : _GEN_529; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_531 = 6'h2e == _idx_T_11[5:0] ? 3'h1 : _GEN_530; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_532 = 6'h2f == _idx_T_11[5:0] ? 3'h2 : _GEN_531; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_533 = 6'h30 == _idx_T_11[5:0] ? 3'h2 : _GEN_532; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_534 = 6'h31 == _idx_T_11[5:0] ? 3'h3 : _GEN_533; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_535 = 6'h32 == _idx_T_11[5:0] ? 3'h4 : _GEN_534; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_536 = 6'h33 == _idx_T_11[5:0] ? 3'h5 : _GEN_535; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_537 = 6'h34 == _idx_T_11[5:0] ? 3'h6 : _GEN_536; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_538 = 6'h35 == _idx_T_11[5:0] ? 3'h7 : _GEN_537; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_539 = 6'h36 == _idx_T_11[5:0] ? 3'h0 : _GEN_538; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_540 = 6'h37 == _idx_T_11[5:0] ? 3'h1 : _GEN_539; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_541 = 6'h38 == _idx_T_11[5:0] ? 3'h1 : _GEN_540; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_542 = 6'h39 == _idx_T_11[5:0] ? 3'h2 : _GEN_541; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_543 = 6'h3a == _idx_T_11[5:0] ? 3'h3 : _GEN_542; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_544 = 6'h3b == _idx_T_11[5:0] ? 3'h4 : _GEN_543; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_545 = 6'h3c == _idx_T_11[5:0] ? 3'h5 : _GEN_544; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_546 = 6'h3d == _idx_T_11[5:0] ? 3'h6 : _GEN_545; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_547 = 6'h3e == _idx_T_11[5:0] ? 3'h7 : _GEN_546; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_548 = 6'h3f == _idx_T_11[5:0] ? 3'h0 : _GEN_547; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_549 = 3'h0 == _GEN_548 ? _io_outData_bits_T_4 : _GEN_477; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_550 = 3'h1 == _GEN_548 ? _io_outData_bits_T_4 : _GEN_478; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_551 = 3'h2 == _GEN_548 ? _io_outData_bits_T_4 : _GEN_479; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_552 = 3'h3 == _GEN_548 ? _io_outData_bits_T_4 : _GEN_480; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_553 = 3'h4 == _GEN_548 ? _io_outData_bits_T_4 : _GEN_481; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_554 = 3'h5 == _GEN_548 ? _io_outData_bits_T_4 : _GEN_482; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_555 = 3'h6 == _GEN_548 ? _io_outData_bits_T_4 : _GEN_483; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_556 = 3'h7 == _GEN_548 ? _io_outData_bits_T_4 : _GEN_484; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [6:0] _idx_T_13 = 3'h5 * 4'h8; // @[LineBuffer.scala 83:30]
  wire [7:0] _idx_T_14 = _idx_T_13 + _GEN_777; // @[LineBuffer.scala 83:49]
  wire  rings_5_outData_valid = RingBuffer_5_io_outData_valid; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] rings_5_outData_bits_0 = RingBuffer_5_io_outData_bits_0; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] _io_outData_bits_T_5 = rings_5_outData_valid ? rings_5_outData_bits_0 : 32'h0; // @[LineBuffer.scala 84:32]
  wire [2:0] _GEN_558 = 6'h1 == _idx_T_14[5:0] ? 3'h1 : 3'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_559 = 6'h2 == _idx_T_14[5:0] ? 3'h2 : _GEN_558; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_560 = 6'h3 == _idx_T_14[5:0] ? 3'h3 : _GEN_559; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_561 = 6'h4 == _idx_T_14[5:0] ? 3'h4 : _GEN_560; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_562 = 6'h5 == _idx_T_14[5:0] ? 3'h5 : _GEN_561; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_563 = 6'h6 == _idx_T_14[5:0] ? 3'h6 : _GEN_562; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_564 = 6'h7 == _idx_T_14[5:0] ? 3'h7 : _GEN_563; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_565 = 6'h8 == _idx_T_14[5:0] ? 3'h7 : _GEN_564; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_566 = 6'h9 == _idx_T_14[5:0] ? 3'h0 : _GEN_565; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_567 = 6'ha == _idx_T_14[5:0] ? 3'h1 : _GEN_566; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_568 = 6'hb == _idx_T_14[5:0] ? 3'h2 : _GEN_567; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_569 = 6'hc == _idx_T_14[5:0] ? 3'h3 : _GEN_568; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_570 = 6'hd == _idx_T_14[5:0] ? 3'h4 : _GEN_569; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_571 = 6'he == _idx_T_14[5:0] ? 3'h5 : _GEN_570; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_572 = 6'hf == _idx_T_14[5:0] ? 3'h6 : _GEN_571; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_573 = 6'h10 == _idx_T_14[5:0] ? 3'h6 : _GEN_572; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_574 = 6'h11 == _idx_T_14[5:0] ? 3'h7 : _GEN_573; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_575 = 6'h12 == _idx_T_14[5:0] ? 3'h0 : _GEN_574; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_576 = 6'h13 == _idx_T_14[5:0] ? 3'h1 : _GEN_575; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_577 = 6'h14 == _idx_T_14[5:0] ? 3'h2 : _GEN_576; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_578 = 6'h15 == _idx_T_14[5:0] ? 3'h3 : _GEN_577; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_579 = 6'h16 == _idx_T_14[5:0] ? 3'h4 : _GEN_578; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_580 = 6'h17 == _idx_T_14[5:0] ? 3'h5 : _GEN_579; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_581 = 6'h18 == _idx_T_14[5:0] ? 3'h5 : _GEN_580; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_582 = 6'h19 == _idx_T_14[5:0] ? 3'h6 : _GEN_581; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_583 = 6'h1a == _idx_T_14[5:0] ? 3'h7 : _GEN_582; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_584 = 6'h1b == _idx_T_14[5:0] ? 3'h0 : _GEN_583; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_585 = 6'h1c == _idx_T_14[5:0] ? 3'h1 : _GEN_584; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_586 = 6'h1d == _idx_T_14[5:0] ? 3'h2 : _GEN_585; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_587 = 6'h1e == _idx_T_14[5:0] ? 3'h3 : _GEN_586; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_588 = 6'h1f == _idx_T_14[5:0] ? 3'h4 : _GEN_587; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_589 = 6'h20 == _idx_T_14[5:0] ? 3'h4 : _GEN_588; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_590 = 6'h21 == _idx_T_14[5:0] ? 3'h5 : _GEN_589; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_591 = 6'h22 == _idx_T_14[5:0] ? 3'h6 : _GEN_590; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_592 = 6'h23 == _idx_T_14[5:0] ? 3'h7 : _GEN_591; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_593 = 6'h24 == _idx_T_14[5:0] ? 3'h0 : _GEN_592; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_594 = 6'h25 == _idx_T_14[5:0] ? 3'h1 : _GEN_593; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_595 = 6'h26 == _idx_T_14[5:0] ? 3'h2 : _GEN_594; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_596 = 6'h27 == _idx_T_14[5:0] ? 3'h3 : _GEN_595; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_597 = 6'h28 == _idx_T_14[5:0] ? 3'h3 : _GEN_596; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_598 = 6'h29 == _idx_T_14[5:0] ? 3'h4 : _GEN_597; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_599 = 6'h2a == _idx_T_14[5:0] ? 3'h5 : _GEN_598; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_600 = 6'h2b == _idx_T_14[5:0] ? 3'h6 : _GEN_599; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_601 = 6'h2c == _idx_T_14[5:0] ? 3'h7 : _GEN_600; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_602 = 6'h2d == _idx_T_14[5:0] ? 3'h0 : _GEN_601; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_603 = 6'h2e == _idx_T_14[5:0] ? 3'h1 : _GEN_602; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_604 = 6'h2f == _idx_T_14[5:0] ? 3'h2 : _GEN_603; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_605 = 6'h30 == _idx_T_14[5:0] ? 3'h2 : _GEN_604; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_606 = 6'h31 == _idx_T_14[5:0] ? 3'h3 : _GEN_605; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_607 = 6'h32 == _idx_T_14[5:0] ? 3'h4 : _GEN_606; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_608 = 6'h33 == _idx_T_14[5:0] ? 3'h5 : _GEN_607; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_609 = 6'h34 == _idx_T_14[5:0] ? 3'h6 : _GEN_608; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_610 = 6'h35 == _idx_T_14[5:0] ? 3'h7 : _GEN_609; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_611 = 6'h36 == _idx_T_14[5:0] ? 3'h0 : _GEN_610; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_612 = 6'h37 == _idx_T_14[5:0] ? 3'h1 : _GEN_611; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_613 = 6'h38 == _idx_T_14[5:0] ? 3'h1 : _GEN_612; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_614 = 6'h39 == _idx_T_14[5:0] ? 3'h2 : _GEN_613; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_615 = 6'h3a == _idx_T_14[5:0] ? 3'h3 : _GEN_614; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_616 = 6'h3b == _idx_T_14[5:0] ? 3'h4 : _GEN_615; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_617 = 6'h3c == _idx_T_14[5:0] ? 3'h5 : _GEN_616; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_618 = 6'h3d == _idx_T_14[5:0] ? 3'h6 : _GEN_617; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_619 = 6'h3e == _idx_T_14[5:0] ? 3'h7 : _GEN_618; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_620 = 6'h3f == _idx_T_14[5:0] ? 3'h0 : _GEN_619; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_621 = 3'h0 == _GEN_620 ? _io_outData_bits_T_5 : _GEN_549; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_622 = 3'h1 == _GEN_620 ? _io_outData_bits_T_5 : _GEN_550; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_623 = 3'h2 == _GEN_620 ? _io_outData_bits_T_5 : _GEN_551; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_624 = 3'h3 == _GEN_620 ? _io_outData_bits_T_5 : _GEN_552; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_625 = 3'h4 == _GEN_620 ? _io_outData_bits_T_5 : _GEN_553; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_626 = 3'h5 == _GEN_620 ? _io_outData_bits_T_5 : _GEN_554; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_627 = 3'h6 == _GEN_620 ? _io_outData_bits_T_5 : _GEN_555; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_628 = 3'h7 == _GEN_620 ? _io_outData_bits_T_5 : _GEN_556; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [6:0] _idx_T_16 = 3'h6 * 4'h8; // @[LineBuffer.scala 83:30]
  wire [7:0] _idx_T_17 = _idx_T_16 + _GEN_777; // @[LineBuffer.scala 83:49]
  wire  rings_6_outData_valid = RingBuffer_6_io_outData_valid; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] rings_6_outData_bits_0 = RingBuffer_6_io_outData_bits_0; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] _io_outData_bits_T_6 = rings_6_outData_valid ? rings_6_outData_bits_0 : 32'h0; // @[LineBuffer.scala 84:32]
  wire [2:0] _GEN_630 = 6'h1 == _idx_T_17[5:0] ? 3'h1 : 3'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_631 = 6'h2 == _idx_T_17[5:0] ? 3'h2 : _GEN_630; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_632 = 6'h3 == _idx_T_17[5:0] ? 3'h3 : _GEN_631; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_633 = 6'h4 == _idx_T_17[5:0] ? 3'h4 : _GEN_632; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_634 = 6'h5 == _idx_T_17[5:0] ? 3'h5 : _GEN_633; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_635 = 6'h6 == _idx_T_17[5:0] ? 3'h6 : _GEN_634; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_636 = 6'h7 == _idx_T_17[5:0] ? 3'h7 : _GEN_635; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_637 = 6'h8 == _idx_T_17[5:0] ? 3'h7 : _GEN_636; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_638 = 6'h9 == _idx_T_17[5:0] ? 3'h0 : _GEN_637; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_639 = 6'ha == _idx_T_17[5:0] ? 3'h1 : _GEN_638; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_640 = 6'hb == _idx_T_17[5:0] ? 3'h2 : _GEN_639; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_641 = 6'hc == _idx_T_17[5:0] ? 3'h3 : _GEN_640; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_642 = 6'hd == _idx_T_17[5:0] ? 3'h4 : _GEN_641; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_643 = 6'he == _idx_T_17[5:0] ? 3'h5 : _GEN_642; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_644 = 6'hf == _idx_T_17[5:0] ? 3'h6 : _GEN_643; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_645 = 6'h10 == _idx_T_17[5:0] ? 3'h6 : _GEN_644; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_646 = 6'h11 == _idx_T_17[5:0] ? 3'h7 : _GEN_645; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_647 = 6'h12 == _idx_T_17[5:0] ? 3'h0 : _GEN_646; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_648 = 6'h13 == _idx_T_17[5:0] ? 3'h1 : _GEN_647; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_649 = 6'h14 == _idx_T_17[5:0] ? 3'h2 : _GEN_648; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_650 = 6'h15 == _idx_T_17[5:0] ? 3'h3 : _GEN_649; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_651 = 6'h16 == _idx_T_17[5:0] ? 3'h4 : _GEN_650; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_652 = 6'h17 == _idx_T_17[5:0] ? 3'h5 : _GEN_651; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_653 = 6'h18 == _idx_T_17[5:0] ? 3'h5 : _GEN_652; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_654 = 6'h19 == _idx_T_17[5:0] ? 3'h6 : _GEN_653; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_655 = 6'h1a == _idx_T_17[5:0] ? 3'h7 : _GEN_654; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_656 = 6'h1b == _idx_T_17[5:0] ? 3'h0 : _GEN_655; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_657 = 6'h1c == _idx_T_17[5:0] ? 3'h1 : _GEN_656; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_658 = 6'h1d == _idx_T_17[5:0] ? 3'h2 : _GEN_657; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_659 = 6'h1e == _idx_T_17[5:0] ? 3'h3 : _GEN_658; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_660 = 6'h1f == _idx_T_17[5:0] ? 3'h4 : _GEN_659; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_661 = 6'h20 == _idx_T_17[5:0] ? 3'h4 : _GEN_660; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_662 = 6'h21 == _idx_T_17[5:0] ? 3'h5 : _GEN_661; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_663 = 6'h22 == _idx_T_17[5:0] ? 3'h6 : _GEN_662; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_664 = 6'h23 == _idx_T_17[5:0] ? 3'h7 : _GEN_663; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_665 = 6'h24 == _idx_T_17[5:0] ? 3'h0 : _GEN_664; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_666 = 6'h25 == _idx_T_17[5:0] ? 3'h1 : _GEN_665; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_667 = 6'h26 == _idx_T_17[5:0] ? 3'h2 : _GEN_666; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_668 = 6'h27 == _idx_T_17[5:0] ? 3'h3 : _GEN_667; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_669 = 6'h28 == _idx_T_17[5:0] ? 3'h3 : _GEN_668; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_670 = 6'h29 == _idx_T_17[5:0] ? 3'h4 : _GEN_669; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_671 = 6'h2a == _idx_T_17[5:0] ? 3'h5 : _GEN_670; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_672 = 6'h2b == _idx_T_17[5:0] ? 3'h6 : _GEN_671; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_673 = 6'h2c == _idx_T_17[5:0] ? 3'h7 : _GEN_672; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_674 = 6'h2d == _idx_T_17[5:0] ? 3'h0 : _GEN_673; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_675 = 6'h2e == _idx_T_17[5:0] ? 3'h1 : _GEN_674; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_676 = 6'h2f == _idx_T_17[5:0] ? 3'h2 : _GEN_675; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_677 = 6'h30 == _idx_T_17[5:0] ? 3'h2 : _GEN_676; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_678 = 6'h31 == _idx_T_17[5:0] ? 3'h3 : _GEN_677; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_679 = 6'h32 == _idx_T_17[5:0] ? 3'h4 : _GEN_678; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_680 = 6'h33 == _idx_T_17[5:0] ? 3'h5 : _GEN_679; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_681 = 6'h34 == _idx_T_17[5:0] ? 3'h6 : _GEN_680; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_682 = 6'h35 == _idx_T_17[5:0] ? 3'h7 : _GEN_681; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_683 = 6'h36 == _idx_T_17[5:0] ? 3'h0 : _GEN_682; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_684 = 6'h37 == _idx_T_17[5:0] ? 3'h1 : _GEN_683; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_685 = 6'h38 == _idx_T_17[5:0] ? 3'h1 : _GEN_684; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_686 = 6'h39 == _idx_T_17[5:0] ? 3'h2 : _GEN_685; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_687 = 6'h3a == _idx_T_17[5:0] ? 3'h3 : _GEN_686; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_688 = 6'h3b == _idx_T_17[5:0] ? 3'h4 : _GEN_687; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_689 = 6'h3c == _idx_T_17[5:0] ? 3'h5 : _GEN_688; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_690 = 6'h3d == _idx_T_17[5:0] ? 3'h6 : _GEN_689; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_691 = 6'h3e == _idx_T_17[5:0] ? 3'h7 : _GEN_690; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_692 = 6'h3f == _idx_T_17[5:0] ? 3'h0 : _GEN_691; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_693 = 3'h0 == _GEN_692 ? _io_outData_bits_T_6 : _GEN_621; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_694 = 3'h1 == _GEN_692 ? _io_outData_bits_T_6 : _GEN_622; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_695 = 3'h2 == _GEN_692 ? _io_outData_bits_T_6 : _GEN_623; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_696 = 3'h3 == _GEN_692 ? _io_outData_bits_T_6 : _GEN_624; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_697 = 3'h4 == _GEN_692 ? _io_outData_bits_T_6 : _GEN_625; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_698 = 3'h5 == _GEN_692 ? _io_outData_bits_T_6 : _GEN_626; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_699 = 3'h6 == _GEN_692 ? _io_outData_bits_T_6 : _GEN_627; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [31:0] _GEN_700 = 3'h7 == _GEN_692 ? _io_outData_bits_T_6 : _GEN_628; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [6:0] _idx_T_19 = 3'h7 * 4'h8; // @[LineBuffer.scala 83:30]
  wire [7:0] _idx_T_20 = _idx_T_19 + _GEN_777; // @[LineBuffer.scala 83:49]
  wire  rings_7_outData_valid = RingBuffer_7_io_outData_valid; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] rings_7_outData_bits_0 = RingBuffer_7_io_outData_bits_0; // @[LineBuffer.scala 27:22 LineBuffer.scala 27:22]
  wire [31:0] _io_outData_bits_T_7 = rings_7_outData_valid ? rings_7_outData_bits_0 : 32'h0; // @[LineBuffer.scala 84:32]
  wire [2:0] _GEN_702 = 6'h1 == _idx_T_20[5:0] ? 3'h1 : 3'h0; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_703 = 6'h2 == _idx_T_20[5:0] ? 3'h2 : _GEN_702; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_704 = 6'h3 == _idx_T_20[5:0] ? 3'h3 : _GEN_703; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_705 = 6'h4 == _idx_T_20[5:0] ? 3'h4 : _GEN_704; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_706 = 6'h5 == _idx_T_20[5:0] ? 3'h5 : _GEN_705; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_707 = 6'h6 == _idx_T_20[5:0] ? 3'h6 : _GEN_706; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_708 = 6'h7 == _idx_T_20[5:0] ? 3'h7 : _GEN_707; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_709 = 6'h8 == _idx_T_20[5:0] ? 3'h7 : _GEN_708; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_710 = 6'h9 == _idx_T_20[5:0] ? 3'h0 : _GEN_709; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_711 = 6'ha == _idx_T_20[5:0] ? 3'h1 : _GEN_710; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_712 = 6'hb == _idx_T_20[5:0] ? 3'h2 : _GEN_711; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_713 = 6'hc == _idx_T_20[5:0] ? 3'h3 : _GEN_712; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_714 = 6'hd == _idx_T_20[5:0] ? 3'h4 : _GEN_713; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_715 = 6'he == _idx_T_20[5:0] ? 3'h5 : _GEN_714; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_716 = 6'hf == _idx_T_20[5:0] ? 3'h6 : _GEN_715; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_717 = 6'h10 == _idx_T_20[5:0] ? 3'h6 : _GEN_716; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_718 = 6'h11 == _idx_T_20[5:0] ? 3'h7 : _GEN_717; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_719 = 6'h12 == _idx_T_20[5:0] ? 3'h0 : _GEN_718; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_720 = 6'h13 == _idx_T_20[5:0] ? 3'h1 : _GEN_719; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_721 = 6'h14 == _idx_T_20[5:0] ? 3'h2 : _GEN_720; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_722 = 6'h15 == _idx_T_20[5:0] ? 3'h3 : _GEN_721; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_723 = 6'h16 == _idx_T_20[5:0] ? 3'h4 : _GEN_722; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_724 = 6'h17 == _idx_T_20[5:0] ? 3'h5 : _GEN_723; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_725 = 6'h18 == _idx_T_20[5:0] ? 3'h5 : _GEN_724; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_726 = 6'h19 == _idx_T_20[5:0] ? 3'h6 : _GEN_725; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_727 = 6'h1a == _idx_T_20[5:0] ? 3'h7 : _GEN_726; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_728 = 6'h1b == _idx_T_20[5:0] ? 3'h0 : _GEN_727; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_729 = 6'h1c == _idx_T_20[5:0] ? 3'h1 : _GEN_728; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_730 = 6'h1d == _idx_T_20[5:0] ? 3'h2 : _GEN_729; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_731 = 6'h1e == _idx_T_20[5:0] ? 3'h3 : _GEN_730; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_732 = 6'h1f == _idx_T_20[5:0] ? 3'h4 : _GEN_731; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_733 = 6'h20 == _idx_T_20[5:0] ? 3'h4 : _GEN_732; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_734 = 6'h21 == _idx_T_20[5:0] ? 3'h5 : _GEN_733; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_735 = 6'h22 == _idx_T_20[5:0] ? 3'h6 : _GEN_734; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_736 = 6'h23 == _idx_T_20[5:0] ? 3'h7 : _GEN_735; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_737 = 6'h24 == _idx_T_20[5:0] ? 3'h0 : _GEN_736; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_738 = 6'h25 == _idx_T_20[5:0] ? 3'h1 : _GEN_737; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_739 = 6'h26 == _idx_T_20[5:0] ? 3'h2 : _GEN_738; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_740 = 6'h27 == _idx_T_20[5:0] ? 3'h3 : _GEN_739; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_741 = 6'h28 == _idx_T_20[5:0] ? 3'h3 : _GEN_740; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_742 = 6'h29 == _idx_T_20[5:0] ? 3'h4 : _GEN_741; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_743 = 6'h2a == _idx_T_20[5:0] ? 3'h5 : _GEN_742; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_744 = 6'h2b == _idx_T_20[5:0] ? 3'h6 : _GEN_743; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_745 = 6'h2c == _idx_T_20[5:0] ? 3'h7 : _GEN_744; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_746 = 6'h2d == _idx_T_20[5:0] ? 3'h0 : _GEN_745; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_747 = 6'h2e == _idx_T_20[5:0] ? 3'h1 : _GEN_746; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_748 = 6'h2f == _idx_T_20[5:0] ? 3'h2 : _GEN_747; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_749 = 6'h30 == _idx_T_20[5:0] ? 3'h2 : _GEN_748; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_750 = 6'h31 == _idx_T_20[5:0] ? 3'h3 : _GEN_749; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_751 = 6'h32 == _idx_T_20[5:0] ? 3'h4 : _GEN_750; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_752 = 6'h33 == _idx_T_20[5:0] ? 3'h5 : _GEN_751; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_753 = 6'h34 == _idx_T_20[5:0] ? 3'h6 : _GEN_752; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_754 = 6'h35 == _idx_T_20[5:0] ? 3'h7 : _GEN_753; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_755 = 6'h36 == _idx_T_20[5:0] ? 3'h0 : _GEN_754; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_756 = 6'h37 == _idx_T_20[5:0] ? 3'h1 : _GEN_755; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_757 = 6'h38 == _idx_T_20[5:0] ? 3'h1 : _GEN_756; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_758 = 6'h39 == _idx_T_20[5:0] ? 3'h2 : _GEN_757; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_759 = 6'h3a == _idx_T_20[5:0] ? 3'h3 : _GEN_758; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_760 = 6'h3b == _idx_T_20[5:0] ? 3'h4 : _GEN_759; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_761 = 6'h3c == _idx_T_20[5:0] ? 3'h5 : _GEN_760; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_762 = 6'h3d == _idx_T_20[5:0] ? 3'h6 : _GEN_761; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_763 = 6'h3e == _idx_T_20[5:0] ? 3'h7 : _GEN_762; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  wire [2:0] _GEN_764 = 6'h3f == _idx_T_20[5:0] ? 3'h0 : _GEN_763; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  RingBuffer RingBuffer ( // @[LineBuffer.scala 27:49]
    .clock(RingBuffer_clock),
    .reset(RingBuffer_reset),
    .io_inData_valid(RingBuffer_io_inData_valid),
    .io_inData_bits_0(RingBuffer_io_inData_bits_0),
    .io_inData_bits_1(RingBuffer_io_inData_bits_1),
    .io_inData_bits_2(RingBuffer_io_inData_bits_2),
    .io_inData_bits_3(RingBuffer_io_inData_bits_3),
    .io_inData_bits_4(RingBuffer_io_inData_bits_4),
    .io_inData_bits_5(RingBuffer_io_inData_bits_5),
    .io_inData_bits_6(RingBuffer_io_inData_bits_6),
    .io_inData_bits_7(RingBuffer_io_inData_bits_7),
    .io_inData_bits_8(RingBuffer_io_inData_bits_8),
    .io_inData_bits_9(RingBuffer_io_inData_bits_9),
    .io_outData_ready(RingBuffer_io_outData_ready),
    .io_outData_valid(RingBuffer_io_outData_valid),
    .io_outData_bits_0(RingBuffer_io_outData_bits_0)
  );
  RingBuffer RingBuffer_1 ( // @[LineBuffer.scala 27:49]
    .clock(RingBuffer_1_clock),
    .reset(RingBuffer_1_reset),
    .io_inData_valid(RingBuffer_1_io_inData_valid),
    .io_inData_bits_0(RingBuffer_1_io_inData_bits_0),
    .io_inData_bits_1(RingBuffer_1_io_inData_bits_1),
    .io_inData_bits_2(RingBuffer_1_io_inData_bits_2),
    .io_inData_bits_3(RingBuffer_1_io_inData_bits_3),
    .io_inData_bits_4(RingBuffer_1_io_inData_bits_4),
    .io_inData_bits_5(RingBuffer_1_io_inData_bits_5),
    .io_inData_bits_6(RingBuffer_1_io_inData_bits_6),
    .io_inData_bits_7(RingBuffer_1_io_inData_bits_7),
    .io_inData_bits_8(RingBuffer_1_io_inData_bits_8),
    .io_inData_bits_9(RingBuffer_1_io_inData_bits_9),
    .io_outData_ready(RingBuffer_1_io_outData_ready),
    .io_outData_valid(RingBuffer_1_io_outData_valid),
    .io_outData_bits_0(RingBuffer_1_io_outData_bits_0)
  );
  RingBuffer RingBuffer_2 ( // @[LineBuffer.scala 27:49]
    .clock(RingBuffer_2_clock),
    .reset(RingBuffer_2_reset),
    .io_inData_valid(RingBuffer_2_io_inData_valid),
    .io_inData_bits_0(RingBuffer_2_io_inData_bits_0),
    .io_inData_bits_1(RingBuffer_2_io_inData_bits_1),
    .io_inData_bits_2(RingBuffer_2_io_inData_bits_2),
    .io_inData_bits_3(RingBuffer_2_io_inData_bits_3),
    .io_inData_bits_4(RingBuffer_2_io_inData_bits_4),
    .io_inData_bits_5(RingBuffer_2_io_inData_bits_5),
    .io_inData_bits_6(RingBuffer_2_io_inData_bits_6),
    .io_inData_bits_7(RingBuffer_2_io_inData_bits_7),
    .io_inData_bits_8(RingBuffer_2_io_inData_bits_8),
    .io_inData_bits_9(RingBuffer_2_io_inData_bits_9),
    .io_outData_ready(RingBuffer_2_io_outData_ready),
    .io_outData_valid(RingBuffer_2_io_outData_valid),
    .io_outData_bits_0(RingBuffer_2_io_outData_bits_0)
  );
  RingBuffer RingBuffer_3 ( // @[LineBuffer.scala 27:49]
    .clock(RingBuffer_3_clock),
    .reset(RingBuffer_3_reset),
    .io_inData_valid(RingBuffer_3_io_inData_valid),
    .io_inData_bits_0(RingBuffer_3_io_inData_bits_0),
    .io_inData_bits_1(RingBuffer_3_io_inData_bits_1),
    .io_inData_bits_2(RingBuffer_3_io_inData_bits_2),
    .io_inData_bits_3(RingBuffer_3_io_inData_bits_3),
    .io_inData_bits_4(RingBuffer_3_io_inData_bits_4),
    .io_inData_bits_5(RingBuffer_3_io_inData_bits_5),
    .io_inData_bits_6(RingBuffer_3_io_inData_bits_6),
    .io_inData_bits_7(RingBuffer_3_io_inData_bits_7),
    .io_inData_bits_8(RingBuffer_3_io_inData_bits_8),
    .io_inData_bits_9(RingBuffer_3_io_inData_bits_9),
    .io_outData_ready(RingBuffer_3_io_outData_ready),
    .io_outData_valid(RingBuffer_3_io_outData_valid),
    .io_outData_bits_0(RingBuffer_3_io_outData_bits_0)
  );
  RingBuffer RingBuffer_4 ( // @[LineBuffer.scala 27:49]
    .clock(RingBuffer_4_clock),
    .reset(RingBuffer_4_reset),
    .io_inData_valid(RingBuffer_4_io_inData_valid),
    .io_inData_bits_0(RingBuffer_4_io_inData_bits_0),
    .io_inData_bits_1(RingBuffer_4_io_inData_bits_1),
    .io_inData_bits_2(RingBuffer_4_io_inData_bits_2),
    .io_inData_bits_3(RingBuffer_4_io_inData_bits_3),
    .io_inData_bits_4(RingBuffer_4_io_inData_bits_4),
    .io_inData_bits_5(RingBuffer_4_io_inData_bits_5),
    .io_inData_bits_6(RingBuffer_4_io_inData_bits_6),
    .io_inData_bits_7(RingBuffer_4_io_inData_bits_7),
    .io_inData_bits_8(RingBuffer_4_io_inData_bits_8),
    .io_inData_bits_9(RingBuffer_4_io_inData_bits_9),
    .io_outData_ready(RingBuffer_4_io_outData_ready),
    .io_outData_valid(RingBuffer_4_io_outData_valid),
    .io_outData_bits_0(RingBuffer_4_io_outData_bits_0)
  );
  RingBuffer RingBuffer_5 ( // @[LineBuffer.scala 27:49]
    .clock(RingBuffer_5_clock),
    .reset(RingBuffer_5_reset),
    .io_inData_valid(RingBuffer_5_io_inData_valid),
    .io_inData_bits_0(RingBuffer_5_io_inData_bits_0),
    .io_inData_bits_1(RingBuffer_5_io_inData_bits_1),
    .io_inData_bits_2(RingBuffer_5_io_inData_bits_2),
    .io_inData_bits_3(RingBuffer_5_io_inData_bits_3),
    .io_inData_bits_4(RingBuffer_5_io_inData_bits_4),
    .io_inData_bits_5(RingBuffer_5_io_inData_bits_5),
    .io_inData_bits_6(RingBuffer_5_io_inData_bits_6),
    .io_inData_bits_7(RingBuffer_5_io_inData_bits_7),
    .io_inData_bits_8(RingBuffer_5_io_inData_bits_8),
    .io_inData_bits_9(RingBuffer_5_io_inData_bits_9),
    .io_outData_ready(RingBuffer_5_io_outData_ready),
    .io_outData_valid(RingBuffer_5_io_outData_valid),
    .io_outData_bits_0(RingBuffer_5_io_outData_bits_0)
  );
  RingBuffer RingBuffer_6 ( // @[LineBuffer.scala 27:49]
    .clock(RingBuffer_6_clock),
    .reset(RingBuffer_6_reset),
    .io_inData_valid(RingBuffer_6_io_inData_valid),
    .io_inData_bits_0(RingBuffer_6_io_inData_bits_0),
    .io_inData_bits_1(RingBuffer_6_io_inData_bits_1),
    .io_inData_bits_2(RingBuffer_6_io_inData_bits_2),
    .io_inData_bits_3(RingBuffer_6_io_inData_bits_3),
    .io_inData_bits_4(RingBuffer_6_io_inData_bits_4),
    .io_inData_bits_5(RingBuffer_6_io_inData_bits_5),
    .io_inData_bits_6(RingBuffer_6_io_inData_bits_6),
    .io_inData_bits_7(RingBuffer_6_io_inData_bits_7),
    .io_inData_bits_8(RingBuffer_6_io_inData_bits_8),
    .io_inData_bits_9(RingBuffer_6_io_inData_bits_9),
    .io_outData_ready(RingBuffer_6_io_outData_ready),
    .io_outData_valid(RingBuffer_6_io_outData_valid),
    .io_outData_bits_0(RingBuffer_6_io_outData_bits_0)
  );
  RingBuffer RingBuffer_7 ( // @[LineBuffer.scala 27:49]
    .clock(RingBuffer_7_clock),
    .reset(RingBuffer_7_reset),
    .io_inData_valid(RingBuffer_7_io_inData_valid),
    .io_inData_bits_0(RingBuffer_7_io_inData_bits_0),
    .io_inData_bits_1(RingBuffer_7_io_inData_bits_1),
    .io_inData_bits_2(RingBuffer_7_io_inData_bits_2),
    .io_inData_bits_3(RingBuffer_7_io_inData_bits_3),
    .io_inData_bits_4(RingBuffer_7_io_inData_bits_4),
    .io_inData_bits_5(RingBuffer_7_io_inData_bits_5),
    .io_inData_bits_6(RingBuffer_7_io_inData_bits_6),
    .io_inData_bits_7(RingBuffer_7_io_inData_bits_7),
    .io_inData_bits_8(RingBuffer_7_io_inData_bits_8),
    .io_inData_bits_9(RingBuffer_7_io_inData_bits_9),
    .io_outData_ready(RingBuffer_7_io_outData_ready),
    .io_outData_valid(RingBuffer_7_io_outData_valid),
    .io_outData_bits_0(RingBuffer_7_io_outData_bits_0)
  );
  assign io_outData_valid = rings_0_outData_valid & rings_1_outData_valid & rings_2_outData_valid &
    rings_3_outData_valid & rings_4_outData_valid & rings_5_outData_valid & rings_6_outData_valid &
    rings_7_outData_valid; // @[LineBuffer.scala 87:82]
  assign io_outData_bits_0 = 3'h0 == _GEN_764 ? _io_outData_bits_T_7 : _GEN_693; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  assign io_outData_bits_1 = 3'h1 == _GEN_764 ? _io_outData_bits_T_7 : _GEN_694; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  assign io_outData_bits_2 = 3'h2 == _GEN_764 ? _io_outData_bits_T_7 : _GEN_695; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  assign io_outData_bits_3 = 3'h3 == _GEN_764 ? _io_outData_bits_T_7 : _GEN_696; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  assign io_outData_bits_4 = 3'h4 == _GEN_764 ? _io_outData_bits_T_7 : _GEN_697; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  assign io_outData_bits_5 = 3'h5 == _GEN_764 ? _io_outData_bits_T_7 : _GEN_698; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  assign io_outData_bits_6 = 3'h6 == _GEN_764 ? _io_outData_bits_T_7 : _GEN_699; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  assign io_outData_bits_7 = 3'h7 == _GEN_764 ? _io_outData_bits_T_7 : _GEN_700; // @[LineBuffer.scala 84:26 LineBuffer.scala 84:26]
  assign RingBuffer_clock = clock;
  assign RingBuffer_reset = reset;
  assign RingBuffer_io_inData_valid = io_inData_valid & _GEN_5; // @[LineBuffer.scala 37:25 LineBuffer.scala 45:29]
  assign RingBuffer_io_inData_bits_0 = io_inData_valid ? _GEN_21 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_io_inData_bits_1 = io_inData_valid ? _GEN_29 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_io_inData_bits_2 = io_inData_valid ? _GEN_37 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_io_inData_bits_3 = io_inData_valid ? _GEN_45 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_io_inData_bits_4 = io_inData_valid ? _GEN_53 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_io_inData_bits_5 = io_inData_valid ? _GEN_61 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_io_inData_bits_6 = io_inData_valid ? _GEN_69 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_io_inData_bits_7 = io_inData_valid ? _GEN_77 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_io_inData_bits_8 = io_inData_valid ? _GEN_85 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_io_inData_bits_9 = io_inData_valid ? _GEN_93 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_io_outData_ready = io_inData_valid ? _GEN_13 : _T; // @[LineBuffer.scala 37:25 LineBuffer.scala 33:30]
  assign RingBuffer_1_clock = clock;
  assign RingBuffer_1_reset = reset;
  assign RingBuffer_1_io_inData_valid = io_inData_valid & _GEN_6; // @[LineBuffer.scala 37:25 LineBuffer.scala 45:29]
  assign RingBuffer_1_io_inData_bits_0 = io_inData_valid ? _GEN_22 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_1_io_inData_bits_1 = io_inData_valid ? _GEN_30 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_1_io_inData_bits_2 = io_inData_valid ? _GEN_38 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_1_io_inData_bits_3 = io_inData_valid ? _GEN_46 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_1_io_inData_bits_4 = io_inData_valid ? _GEN_54 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_1_io_inData_bits_5 = io_inData_valid ? _GEN_62 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_1_io_inData_bits_6 = io_inData_valid ? _GEN_70 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_1_io_inData_bits_7 = io_inData_valid ? _GEN_78 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_1_io_inData_bits_8 = io_inData_valid ? _GEN_86 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_1_io_inData_bits_9 = io_inData_valid ? _GEN_94 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_1_io_outData_ready = io_inData_valid ? _GEN_14 : _T; // @[LineBuffer.scala 37:25 LineBuffer.scala 33:30]
  assign RingBuffer_2_clock = clock;
  assign RingBuffer_2_reset = reset;
  assign RingBuffer_2_io_inData_valid = io_inData_valid & _GEN_7; // @[LineBuffer.scala 37:25 LineBuffer.scala 45:29]
  assign RingBuffer_2_io_inData_bits_0 = io_inData_valid ? _GEN_23 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_2_io_inData_bits_1 = io_inData_valid ? _GEN_31 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_2_io_inData_bits_2 = io_inData_valid ? _GEN_39 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_2_io_inData_bits_3 = io_inData_valid ? _GEN_47 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_2_io_inData_bits_4 = io_inData_valid ? _GEN_55 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_2_io_inData_bits_5 = io_inData_valid ? _GEN_63 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_2_io_inData_bits_6 = io_inData_valid ? _GEN_71 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_2_io_inData_bits_7 = io_inData_valid ? _GEN_79 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_2_io_inData_bits_8 = io_inData_valid ? _GEN_87 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_2_io_inData_bits_9 = io_inData_valid ? _GEN_95 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_2_io_outData_ready = io_inData_valid ? _GEN_15 : _T; // @[LineBuffer.scala 37:25 LineBuffer.scala 33:30]
  assign RingBuffer_3_clock = clock;
  assign RingBuffer_3_reset = reset;
  assign RingBuffer_3_io_inData_valid = io_inData_valid & _GEN_8; // @[LineBuffer.scala 37:25 LineBuffer.scala 45:29]
  assign RingBuffer_3_io_inData_bits_0 = io_inData_valid ? _GEN_24 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_3_io_inData_bits_1 = io_inData_valid ? _GEN_32 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_3_io_inData_bits_2 = io_inData_valid ? _GEN_40 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_3_io_inData_bits_3 = io_inData_valid ? _GEN_48 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_3_io_inData_bits_4 = io_inData_valid ? _GEN_56 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_3_io_inData_bits_5 = io_inData_valid ? _GEN_64 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_3_io_inData_bits_6 = io_inData_valid ? _GEN_72 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_3_io_inData_bits_7 = io_inData_valid ? _GEN_80 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_3_io_inData_bits_8 = io_inData_valid ? _GEN_88 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_3_io_inData_bits_9 = io_inData_valid ? _GEN_96 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_3_io_outData_ready = io_inData_valid ? _GEN_16 : _T; // @[LineBuffer.scala 37:25 LineBuffer.scala 33:30]
  assign RingBuffer_4_clock = clock;
  assign RingBuffer_4_reset = reset;
  assign RingBuffer_4_io_inData_valid = io_inData_valid & _GEN_9; // @[LineBuffer.scala 37:25 LineBuffer.scala 45:29]
  assign RingBuffer_4_io_inData_bits_0 = io_inData_valid ? _GEN_25 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_4_io_inData_bits_1 = io_inData_valid ? _GEN_33 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_4_io_inData_bits_2 = io_inData_valid ? _GEN_41 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_4_io_inData_bits_3 = io_inData_valid ? _GEN_49 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_4_io_inData_bits_4 = io_inData_valid ? _GEN_57 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_4_io_inData_bits_5 = io_inData_valid ? _GEN_65 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_4_io_inData_bits_6 = io_inData_valid ? _GEN_73 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_4_io_inData_bits_7 = io_inData_valid ? _GEN_81 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_4_io_inData_bits_8 = io_inData_valid ? _GEN_89 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_4_io_inData_bits_9 = io_inData_valid ? _GEN_97 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_4_io_outData_ready = io_inData_valid ? _GEN_17 : _T; // @[LineBuffer.scala 37:25 LineBuffer.scala 33:30]
  assign RingBuffer_5_clock = clock;
  assign RingBuffer_5_reset = reset;
  assign RingBuffer_5_io_inData_valid = io_inData_valid & _GEN_10; // @[LineBuffer.scala 37:25 LineBuffer.scala 45:29]
  assign RingBuffer_5_io_inData_bits_0 = io_inData_valid ? _GEN_26 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_5_io_inData_bits_1 = io_inData_valid ? _GEN_34 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_5_io_inData_bits_2 = io_inData_valid ? _GEN_42 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_5_io_inData_bits_3 = io_inData_valid ? _GEN_50 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_5_io_inData_bits_4 = io_inData_valid ? _GEN_58 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_5_io_inData_bits_5 = io_inData_valid ? _GEN_66 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_5_io_inData_bits_6 = io_inData_valid ? _GEN_74 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_5_io_inData_bits_7 = io_inData_valid ? _GEN_82 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_5_io_inData_bits_8 = io_inData_valid ? _GEN_90 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_5_io_inData_bits_9 = io_inData_valid ? _GEN_98 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_5_io_outData_ready = io_inData_valid ? _GEN_18 : _T; // @[LineBuffer.scala 37:25 LineBuffer.scala 33:30]
  assign RingBuffer_6_clock = clock;
  assign RingBuffer_6_reset = reset;
  assign RingBuffer_6_io_inData_valid = io_inData_valid & _GEN_11; // @[LineBuffer.scala 37:25 LineBuffer.scala 45:29]
  assign RingBuffer_6_io_inData_bits_0 = io_inData_valid ? _GEN_27 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_6_io_inData_bits_1 = io_inData_valid ? _GEN_35 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_6_io_inData_bits_2 = io_inData_valid ? _GEN_43 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_6_io_inData_bits_3 = io_inData_valid ? _GEN_51 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_6_io_inData_bits_4 = io_inData_valid ? _GEN_59 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_6_io_inData_bits_5 = io_inData_valid ? _GEN_67 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_6_io_inData_bits_6 = io_inData_valid ? _GEN_75 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_6_io_inData_bits_7 = io_inData_valid ? _GEN_83 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_6_io_inData_bits_8 = io_inData_valid ? _GEN_91 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_6_io_inData_bits_9 = io_inData_valid ? _GEN_99 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_6_io_outData_ready = io_inData_valid ? _GEN_19 : _T; // @[LineBuffer.scala 37:25 LineBuffer.scala 33:30]
  assign RingBuffer_7_clock = clock;
  assign RingBuffer_7_reset = reset;
  assign RingBuffer_7_io_inData_valid = io_inData_valid & _GEN_12; // @[LineBuffer.scala 37:25 LineBuffer.scala 45:29]
  assign RingBuffer_7_io_inData_bits_0 = io_inData_valid ? _GEN_28 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_7_io_inData_bits_1 = io_inData_valid ? _GEN_36 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_7_io_inData_bits_2 = io_inData_valid ? _GEN_44 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_7_io_inData_bits_3 = io_inData_valid ? _GEN_52 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_7_io_inData_bits_4 = io_inData_valid ? _GEN_60 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_7_io_inData_bits_5 = io_inData_valid ? _GEN_68 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_7_io_inData_bits_6 = io_inData_valid ? _GEN_76 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_7_io_inData_bits_7 = io_inData_valid ? _GEN_84 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_7_io_inData_bits_8 = io_inData_valid ? _GEN_92 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_7_io_inData_bits_9 = io_inData_valid ? _GEN_100 : 32'h0; // @[LineBuffer.scala 37:25 LineBuffer.scala 32:31]
  assign RingBuffer_7_io_outData_ready = io_inData_valid ? _GEN_20 : _T; // @[LineBuffer.scala 37:25 LineBuffer.scala 33:30]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 60:40]
      _colCntr <= 4'h0; // @[Counter.scala 60:40]
    end else if (_T) begin // @[Counter.scala 118:17]
      if (wrap_wrap) begin // @[Counter.scala 86:20]
        _colCntr <= 4'h0; // @[Counter.scala 86:28]
      end else begin
        _colCntr <= _wrap_value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      rowCntr <= 3'h0; // @[Counter.scala 60:40]
    end else if (colCntrWillWrap) begin // @[Counter.scala 118:17]
      rowCntr <= _rowCntr_wrap_value_T_1; // @[Counter.scala 76:15]
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
  _colCntr = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  rowCntr = _RAND_1[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module KernelShiftRegister(
  input         clock,
  input         reset,
  input  [31:0] io_inData_bits_0,
  input  [31:0] io_inData_bits_1,
  input  [31:0] io_inData_bits_2,
  input  [31:0] io_inData_bits_3,
  input  [31:0] io_inData_bits_4,
  input  [31:0] io_inData_bits_5,
  input  [31:0] io_inData_bits_6,
  input  [31:0] io_inData_bits_7,
  output [31:0] io_outData_bits_0_0,
  output [31:0] io_outData_bits_0_1,
  output [31:0] io_outData_bits_0_2,
  output [31:0] io_outData_bits_0_3,
  output [31:0] io_outData_bits_0_4,
  output [31:0] io_outData_bits_0_5,
  output [31:0] io_outData_bits_0_6,
  output [31:0] io_outData_bits_0_7,
  output [31:0] io_outData_bits_1_0,
  output [31:0] io_outData_bits_1_1,
  output [31:0] io_outData_bits_1_2,
  output [31:0] io_outData_bits_1_3,
  output [31:0] io_outData_bits_1_4,
  output [31:0] io_outData_bits_1_5,
  output [31:0] io_outData_bits_1_6,
  output [31:0] io_outData_bits_1_7,
  output [31:0] io_outData_bits_2_0,
  output [31:0] io_outData_bits_2_1,
  output [31:0] io_outData_bits_2_2,
  output [31:0] io_outData_bits_2_3,
  output [31:0] io_outData_bits_2_4,
  output [31:0] io_outData_bits_2_5,
  output [31:0] io_outData_bits_2_6,
  output [31:0] io_outData_bits_2_7,
  output [31:0] io_outData_bits_3_0,
  output [31:0] io_outData_bits_3_1,
  output [31:0] io_outData_bits_3_2,
  output [31:0] io_outData_bits_3_3,
  output [31:0] io_outData_bits_3_4,
  output [31:0] io_outData_bits_3_5,
  output [31:0] io_outData_bits_3_6,
  output [31:0] io_outData_bits_3_7,
  output [31:0] io_outData_bits_4_0,
  output [31:0] io_outData_bits_4_1,
  output [31:0] io_outData_bits_4_2,
  output [31:0] io_outData_bits_4_3,
  output [31:0] io_outData_bits_4_4,
  output [31:0] io_outData_bits_4_5,
  output [31:0] io_outData_bits_4_6,
  output [31:0] io_outData_bits_4_7,
  output [31:0] io_outData_bits_5_0,
  output [31:0] io_outData_bits_5_1,
  output [31:0] io_outData_bits_5_2,
  output [31:0] io_outData_bits_5_3,
  output [31:0] io_outData_bits_5_4,
  output [31:0] io_outData_bits_5_5,
  output [31:0] io_outData_bits_5_6,
  output [31:0] io_outData_bits_5_7,
  output [31:0] io_outData_bits_6_0,
  output [31:0] io_outData_bits_6_1,
  output [31:0] io_outData_bits_6_2,
  output [31:0] io_outData_bits_6_3,
  output [31:0] io_outData_bits_6_4,
  output [31:0] io_outData_bits_6_5,
  output [31:0] io_outData_bits_6_6,
  output [31:0] io_outData_bits_6_7,
  output [31:0] io_outData_bits_7_0,
  output [31:0] io_outData_bits_7_1,
  output [31:0] io_outData_bits_7_2,
  output [31:0] io_outData_bits_7_3,
  output [31:0] io_outData_bits_7_4,
  output [31:0] io_outData_bits_7_5,
  output [31:0] io_outData_bits_7_6,
  output [31:0] io_outData_bits_7_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] kernel_1_0; // @[Reg.scala 27:20]
  reg [31:0] kernel_1_1; // @[Reg.scala 27:20]
  reg [31:0] kernel_1_2; // @[Reg.scala 27:20]
  reg [31:0] kernel_1_3; // @[Reg.scala 27:20]
  reg [31:0] kernel_1_4; // @[Reg.scala 27:20]
  reg [31:0] kernel_1_5; // @[Reg.scala 27:20]
  reg [31:0] kernel_1_6; // @[Reg.scala 27:20]
  reg [31:0] kernel_1_7; // @[Reg.scala 27:20]
  reg [31:0] kernel_2_0; // @[Reg.scala 27:20]
  reg [31:0] kernel_2_1; // @[Reg.scala 27:20]
  reg [31:0] kernel_2_2; // @[Reg.scala 27:20]
  reg [31:0] kernel_2_3; // @[Reg.scala 27:20]
  reg [31:0] kernel_2_4; // @[Reg.scala 27:20]
  reg [31:0] kernel_2_5; // @[Reg.scala 27:20]
  reg [31:0] kernel_2_6; // @[Reg.scala 27:20]
  reg [31:0] kernel_2_7; // @[Reg.scala 27:20]
  reg [31:0] kernel_3_0; // @[Reg.scala 27:20]
  reg [31:0] kernel_3_1; // @[Reg.scala 27:20]
  reg [31:0] kernel_3_2; // @[Reg.scala 27:20]
  reg [31:0] kernel_3_3; // @[Reg.scala 27:20]
  reg [31:0] kernel_3_4; // @[Reg.scala 27:20]
  reg [31:0] kernel_3_5; // @[Reg.scala 27:20]
  reg [31:0] kernel_3_6; // @[Reg.scala 27:20]
  reg [31:0] kernel_3_7; // @[Reg.scala 27:20]
  reg [31:0] kernel_4_0; // @[Reg.scala 27:20]
  reg [31:0] kernel_4_1; // @[Reg.scala 27:20]
  reg [31:0] kernel_4_2; // @[Reg.scala 27:20]
  reg [31:0] kernel_4_3; // @[Reg.scala 27:20]
  reg [31:0] kernel_4_4; // @[Reg.scala 27:20]
  reg [31:0] kernel_4_5; // @[Reg.scala 27:20]
  reg [31:0] kernel_4_6; // @[Reg.scala 27:20]
  reg [31:0] kernel_4_7; // @[Reg.scala 27:20]
  reg [31:0] kernel_5_0; // @[Reg.scala 27:20]
  reg [31:0] kernel_5_1; // @[Reg.scala 27:20]
  reg [31:0] kernel_5_2; // @[Reg.scala 27:20]
  reg [31:0] kernel_5_3; // @[Reg.scala 27:20]
  reg [31:0] kernel_5_4; // @[Reg.scala 27:20]
  reg [31:0] kernel_5_5; // @[Reg.scala 27:20]
  reg [31:0] kernel_5_6; // @[Reg.scala 27:20]
  reg [31:0] kernel_5_7; // @[Reg.scala 27:20]
  reg [31:0] kernel_6_0; // @[Reg.scala 27:20]
  reg [31:0] kernel_6_1; // @[Reg.scala 27:20]
  reg [31:0] kernel_6_2; // @[Reg.scala 27:20]
  reg [31:0] kernel_6_3; // @[Reg.scala 27:20]
  reg [31:0] kernel_6_4; // @[Reg.scala 27:20]
  reg [31:0] kernel_6_5; // @[Reg.scala 27:20]
  reg [31:0] kernel_6_6; // @[Reg.scala 27:20]
  reg [31:0] kernel_6_7; // @[Reg.scala 27:20]
  reg [31:0] kernel_7_0; // @[Reg.scala 27:20]
  reg [31:0] kernel_7_1; // @[Reg.scala 27:20]
  reg [31:0] kernel_7_2; // @[Reg.scala 27:20]
  reg [31:0] kernel_7_3; // @[Reg.scala 27:20]
  reg [31:0] kernel_7_4; // @[Reg.scala 27:20]
  reg [31:0] kernel_7_5; // @[Reg.scala 27:20]
  reg [31:0] kernel_7_6; // @[Reg.scala 27:20]
  reg [31:0] kernel_7_7; // @[Reg.scala 27:20]
  assign io_outData_bits_0_0 = io_inData_bits_0; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_0_1 = io_inData_bits_1; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_0_2 = io_inData_bits_2; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_0_3 = io_inData_bits_3; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_0_4 = io_inData_bits_4; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_0_5 = io_inData_bits_5; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_0_6 = io_inData_bits_6; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_0_7 = io_inData_bits_7; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_1_0 = kernel_1_0; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_1_1 = kernel_1_1; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_1_2 = kernel_1_2; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_1_3 = kernel_1_3; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_1_4 = kernel_1_4; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_1_5 = kernel_1_5; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_1_6 = kernel_1_6; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_1_7 = kernel_1_7; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_2_0 = kernel_2_0; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_2_1 = kernel_2_1; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_2_2 = kernel_2_2; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_2_3 = kernel_2_3; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_2_4 = kernel_2_4; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_2_5 = kernel_2_5; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_2_6 = kernel_2_6; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_2_7 = kernel_2_7; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_3_0 = kernel_3_0; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_3_1 = kernel_3_1; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_3_2 = kernel_3_2; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_3_3 = kernel_3_3; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_3_4 = kernel_3_4; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_3_5 = kernel_3_5; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_3_6 = kernel_3_6; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_3_7 = kernel_3_7; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_4_0 = kernel_4_0; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_4_1 = kernel_4_1; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_4_2 = kernel_4_2; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_4_3 = kernel_4_3; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_4_4 = kernel_4_4; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_4_5 = kernel_4_5; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_4_6 = kernel_4_6; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_4_7 = kernel_4_7; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_5_0 = kernel_5_0; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_5_1 = kernel_5_1; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_5_2 = kernel_5_2; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_5_3 = kernel_5_3; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_5_4 = kernel_5_4; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_5_5 = kernel_5_5; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_5_6 = kernel_5_6; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_5_7 = kernel_5_7; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_6_0 = kernel_6_0; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_6_1 = kernel_6_1; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_6_2 = kernel_6_2; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_6_3 = kernel_6_3; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_6_4 = kernel_6_4; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_6_5 = kernel_6_5; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_6_6 = kernel_6_6; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_6_7 = kernel_6_7; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_7_0 = kernel_7_0; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_7_1 = kernel_7_1; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_7_2 = kernel_7_2; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_7_3 = kernel_7_3; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_7_4 = kernel_7_4; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_7_5 = kernel_7_5; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_7_6 = kernel_7_6; // @[KernelShiftRegister.scala 24:27]
  assign io_outData_bits_7_7 = kernel_7_7; // @[KernelShiftRegister.scala 24:27]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      kernel_1_0 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_1_0 <= io_inData_bits_0;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_1_1 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_1_1 <= io_inData_bits_1;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_1_2 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_1_2 <= io_inData_bits_2;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_1_3 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_1_3 <= io_inData_bits_3;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_1_4 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_1_4 <= io_inData_bits_4;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_1_5 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_1_5 <= io_inData_bits_5;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_1_6 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_1_6 <= io_inData_bits_6;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_1_7 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_1_7 <= io_inData_bits_7;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_2_0 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_2_0 <= kernel_1_0;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_2_1 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_2_1 <= kernel_1_1;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_2_2 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_2_2 <= kernel_1_2;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_2_3 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_2_3 <= kernel_1_3;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_2_4 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_2_4 <= kernel_1_4;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_2_5 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_2_5 <= kernel_1_5;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_2_6 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_2_6 <= kernel_1_6;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_2_7 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_2_7 <= kernel_1_7;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_3_0 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_3_0 <= kernel_2_0;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_3_1 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_3_1 <= kernel_2_1;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_3_2 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_3_2 <= kernel_2_2;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_3_3 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_3_3 <= kernel_2_3;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_3_4 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_3_4 <= kernel_2_4;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_3_5 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_3_5 <= kernel_2_5;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_3_6 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_3_6 <= kernel_2_6;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_3_7 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_3_7 <= kernel_2_7;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_4_0 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_4_0 <= kernel_3_0;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_4_1 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_4_1 <= kernel_3_1;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_4_2 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_4_2 <= kernel_3_2;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_4_3 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_4_3 <= kernel_3_3;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_4_4 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_4_4 <= kernel_3_4;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_4_5 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_4_5 <= kernel_3_5;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_4_6 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_4_6 <= kernel_3_6;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_4_7 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_4_7 <= kernel_3_7;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_5_0 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_5_0 <= kernel_4_0;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_5_1 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_5_1 <= kernel_4_1;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_5_2 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_5_2 <= kernel_4_2;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_5_3 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_5_3 <= kernel_4_3;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_5_4 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_5_4 <= kernel_4_4;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_5_5 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_5_5 <= kernel_4_5;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_5_6 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_5_6 <= kernel_4_6;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_5_7 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_5_7 <= kernel_4_7;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_6_0 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_6_0 <= kernel_5_0;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_6_1 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_6_1 <= kernel_5_1;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_6_2 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_6_2 <= kernel_5_2;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_6_3 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_6_3 <= kernel_5_3;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_6_4 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_6_4 <= kernel_5_4;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_6_5 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_6_5 <= kernel_5_5;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_6_6 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_6_6 <= kernel_5_6;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_6_7 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_6_7 <= kernel_5_7;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_7_0 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_7_0 <= kernel_6_0;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_7_1 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_7_1 <= kernel_6_1;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_7_2 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_7_2 <= kernel_6_2;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_7_3 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_7_3 <= kernel_6_3;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_7_4 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_7_4 <= kernel_6_4;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_7_5 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_7_5 <= kernel_6_5;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_7_6 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_7_6 <= kernel_6_6;
    end
    if (reset) begin // @[Reg.scala 27:20]
      kernel_7_7 <= 32'h0; // @[Reg.scala 27:20]
    end else begin
      kernel_7_7 <= kernel_6_7;
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
  kernel_1_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  kernel_1_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  kernel_1_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  kernel_1_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  kernel_1_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  kernel_1_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  kernel_1_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  kernel_1_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  kernel_2_0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  kernel_2_1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  kernel_2_2 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  kernel_2_3 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  kernel_2_4 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  kernel_2_5 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  kernel_2_6 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  kernel_2_7 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  kernel_3_0 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  kernel_3_1 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  kernel_3_2 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  kernel_3_3 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  kernel_3_4 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  kernel_3_5 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  kernel_3_6 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  kernel_3_7 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  kernel_4_0 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  kernel_4_1 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  kernel_4_2 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  kernel_4_3 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  kernel_4_4 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  kernel_4_5 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  kernel_4_6 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  kernel_4_7 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  kernel_5_0 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  kernel_5_1 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  kernel_5_2 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  kernel_5_3 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  kernel_5_4 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  kernel_5_5 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  kernel_5_6 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  kernel_5_7 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  kernel_6_0 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  kernel_6_1 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  kernel_6_2 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  kernel_6_3 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  kernel_6_4 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  kernel_6_5 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  kernel_6_6 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  kernel_6_7 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  kernel_7_0 = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  kernel_7_1 = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  kernel_7_2 = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  kernel_7_3 = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  kernel_7_4 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  kernel_7_5 = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  kernel_7_6 = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  kernel_7_7 = _RAND_55[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Im2KernelPatch(
  input         clock,
  input         reset,
  input         io_inData_valid,
  input  [31:0] io_inData_bits_0,
  input  [31:0] io_inData_bits_1,
  input  [31:0] io_inData_bits_2,
  input  [31:0] io_inData_bits_3,
  input  [31:0] io_inData_bits_4,
  input  [31:0] io_inData_bits_5,
  input  [31:0] io_inData_bits_6,
  input  [31:0] io_inData_bits_7,
  input  [31:0] io_inData_bits_8,
  input  [31:0] io_inData_bits_9,
  output [31:0] io_outData_0_0,
  output [31:0] io_outData_0_1,
  output [31:0] io_outData_0_2,
  output [31:0] io_outData_0_3,
  output [31:0] io_outData_0_4,
  output [31:0] io_outData_0_5,
  output [31:0] io_outData_0_6,
  output [31:0] io_outData_0_7,
  output [31:0] io_outData_1_0,
  output [31:0] io_outData_1_1,
  output [31:0] io_outData_1_2,
  output [31:0] io_outData_1_3,
  output [31:0] io_outData_1_4,
  output [31:0] io_outData_1_5,
  output [31:0] io_outData_1_6,
  output [31:0] io_outData_1_7,
  output [31:0] io_outData_2_0,
  output [31:0] io_outData_2_1,
  output [31:0] io_outData_2_2,
  output [31:0] io_outData_2_3,
  output [31:0] io_outData_2_4,
  output [31:0] io_outData_2_5,
  output [31:0] io_outData_2_6,
  output [31:0] io_outData_2_7,
  output [31:0] io_outData_3_0,
  output [31:0] io_outData_3_1,
  output [31:0] io_outData_3_2,
  output [31:0] io_outData_3_3,
  output [31:0] io_outData_3_4,
  output [31:0] io_outData_3_5,
  output [31:0] io_outData_3_6,
  output [31:0] io_outData_3_7,
  output [31:0] io_outData_4_0,
  output [31:0] io_outData_4_1,
  output [31:0] io_outData_4_2,
  output [31:0] io_outData_4_3,
  output [31:0] io_outData_4_4,
  output [31:0] io_outData_4_5,
  output [31:0] io_outData_4_6,
  output [31:0] io_outData_4_7,
  output [31:0] io_outData_5_0,
  output [31:0] io_outData_5_1,
  output [31:0] io_outData_5_2,
  output [31:0] io_outData_5_3,
  output [31:0] io_outData_5_4,
  output [31:0] io_outData_5_5,
  output [31:0] io_outData_5_6,
  output [31:0] io_outData_5_7,
  output [31:0] io_outData_6_0,
  output [31:0] io_outData_6_1,
  output [31:0] io_outData_6_2,
  output [31:0] io_outData_6_3,
  output [31:0] io_outData_6_4,
  output [31:0] io_outData_6_5,
  output [31:0] io_outData_6_6,
  output [31:0] io_outData_6_7,
  output [31:0] io_outData_7_0,
  output [31:0] io_outData_7_1,
  output [31:0] io_outData_7_2,
  output [31:0] io_outData_7_3,
  output [31:0] io_outData_7_4,
  output [31:0] io_outData_7_5,
  output [31:0] io_outData_7_6,
  output [31:0] io_outData_7_7
);
  wire  lineBuffer_clock; // @[Im2KernelPatch.scala 13:26]
  wire  lineBuffer_reset; // @[Im2KernelPatch.scala 13:26]
  wire  lineBuffer_io_inData_valid; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_inData_bits_0; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_inData_bits_1; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_inData_bits_2; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_inData_bits_3; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_inData_bits_4; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_inData_bits_5; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_inData_bits_6; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_inData_bits_7; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_inData_bits_8; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_inData_bits_9; // @[Im2KernelPatch.scala 13:26]
  wire  lineBuffer_io_outData_valid; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_outData_bits_0; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_outData_bits_1; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_outData_bits_2; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_outData_bits_3; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_outData_bits_4; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_outData_bits_5; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_outData_bits_6; // @[Im2KernelPatch.scala 13:26]
  wire [31:0] lineBuffer_io_outData_bits_7; // @[Im2KernelPatch.scala 13:26]
  wire  kernelPatch_clock; // @[Im2KernelPatch.scala 14:27]
  wire  kernelPatch_reset; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_inData_bits_0; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_inData_bits_1; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_inData_bits_2; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_inData_bits_3; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_inData_bits_4; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_inData_bits_5; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_inData_bits_6; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_inData_bits_7; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_0_0; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_0_1; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_0_2; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_0_3; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_0_4; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_0_5; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_0_6; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_0_7; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_1_0; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_1_1; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_1_2; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_1_3; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_1_4; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_1_5; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_1_6; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_1_7; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_2_0; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_2_1; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_2_2; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_2_3; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_2_4; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_2_5; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_2_6; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_2_7; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_3_0; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_3_1; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_3_2; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_3_3; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_3_4; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_3_5; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_3_6; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_3_7; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_4_0; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_4_1; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_4_2; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_4_3; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_4_4; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_4_5; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_4_6; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_4_7; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_5_0; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_5_1; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_5_2; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_5_3; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_5_4; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_5_5; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_5_6; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_5_7; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_6_0; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_6_1; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_6_2; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_6_3; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_6_4; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_6_5; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_6_6; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_6_7; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_7_0; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_7_1; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_7_2; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_7_3; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_7_4; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_7_5; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_7_6; // @[Im2KernelPatch.scala 14:27]
  wire [31:0] kernelPatch_io_outData_bits_7_7; // @[Im2KernelPatch.scala 14:27]
  LineBuffer lineBuffer ( // @[Im2KernelPatch.scala 13:26]
    .clock(lineBuffer_clock),
    .reset(lineBuffer_reset),
    .io_inData_valid(lineBuffer_io_inData_valid),
    .io_inData_bits_0(lineBuffer_io_inData_bits_0),
    .io_inData_bits_1(lineBuffer_io_inData_bits_1),
    .io_inData_bits_2(lineBuffer_io_inData_bits_2),
    .io_inData_bits_3(lineBuffer_io_inData_bits_3),
    .io_inData_bits_4(lineBuffer_io_inData_bits_4),
    .io_inData_bits_5(lineBuffer_io_inData_bits_5),
    .io_inData_bits_6(lineBuffer_io_inData_bits_6),
    .io_inData_bits_7(lineBuffer_io_inData_bits_7),
    .io_inData_bits_8(lineBuffer_io_inData_bits_8),
    .io_inData_bits_9(lineBuffer_io_inData_bits_9),
    .io_outData_valid(lineBuffer_io_outData_valid),
    .io_outData_bits_0(lineBuffer_io_outData_bits_0),
    .io_outData_bits_1(lineBuffer_io_outData_bits_1),
    .io_outData_bits_2(lineBuffer_io_outData_bits_2),
    .io_outData_bits_3(lineBuffer_io_outData_bits_3),
    .io_outData_bits_4(lineBuffer_io_outData_bits_4),
    .io_outData_bits_5(lineBuffer_io_outData_bits_5),
    .io_outData_bits_6(lineBuffer_io_outData_bits_6),
    .io_outData_bits_7(lineBuffer_io_outData_bits_7)
  );
  KernelShiftRegister kernelPatch ( // @[Im2KernelPatch.scala 14:27]
    .clock(kernelPatch_clock),
    .reset(kernelPatch_reset),
    .io_inData_bits_0(kernelPatch_io_inData_bits_0),
    .io_inData_bits_1(kernelPatch_io_inData_bits_1),
    .io_inData_bits_2(kernelPatch_io_inData_bits_2),
    .io_inData_bits_3(kernelPatch_io_inData_bits_3),
    .io_inData_bits_4(kernelPatch_io_inData_bits_4),
    .io_inData_bits_5(kernelPatch_io_inData_bits_5),
    .io_inData_bits_6(kernelPatch_io_inData_bits_6),
    .io_inData_bits_7(kernelPatch_io_inData_bits_7),
    .io_outData_bits_0_0(kernelPatch_io_outData_bits_0_0),
    .io_outData_bits_0_1(kernelPatch_io_outData_bits_0_1),
    .io_outData_bits_0_2(kernelPatch_io_outData_bits_0_2),
    .io_outData_bits_0_3(kernelPatch_io_outData_bits_0_3),
    .io_outData_bits_0_4(kernelPatch_io_outData_bits_0_4),
    .io_outData_bits_0_5(kernelPatch_io_outData_bits_0_5),
    .io_outData_bits_0_6(kernelPatch_io_outData_bits_0_6),
    .io_outData_bits_0_7(kernelPatch_io_outData_bits_0_7),
    .io_outData_bits_1_0(kernelPatch_io_outData_bits_1_0),
    .io_outData_bits_1_1(kernelPatch_io_outData_bits_1_1),
    .io_outData_bits_1_2(kernelPatch_io_outData_bits_1_2),
    .io_outData_bits_1_3(kernelPatch_io_outData_bits_1_3),
    .io_outData_bits_1_4(kernelPatch_io_outData_bits_1_4),
    .io_outData_bits_1_5(kernelPatch_io_outData_bits_1_5),
    .io_outData_bits_1_6(kernelPatch_io_outData_bits_1_6),
    .io_outData_bits_1_7(kernelPatch_io_outData_bits_1_7),
    .io_outData_bits_2_0(kernelPatch_io_outData_bits_2_0),
    .io_outData_bits_2_1(kernelPatch_io_outData_bits_2_1),
    .io_outData_bits_2_2(kernelPatch_io_outData_bits_2_2),
    .io_outData_bits_2_3(kernelPatch_io_outData_bits_2_3),
    .io_outData_bits_2_4(kernelPatch_io_outData_bits_2_4),
    .io_outData_bits_2_5(kernelPatch_io_outData_bits_2_5),
    .io_outData_bits_2_6(kernelPatch_io_outData_bits_2_6),
    .io_outData_bits_2_7(kernelPatch_io_outData_bits_2_7),
    .io_outData_bits_3_0(kernelPatch_io_outData_bits_3_0),
    .io_outData_bits_3_1(kernelPatch_io_outData_bits_3_1),
    .io_outData_bits_3_2(kernelPatch_io_outData_bits_3_2),
    .io_outData_bits_3_3(kernelPatch_io_outData_bits_3_3),
    .io_outData_bits_3_4(kernelPatch_io_outData_bits_3_4),
    .io_outData_bits_3_5(kernelPatch_io_outData_bits_3_5),
    .io_outData_bits_3_6(kernelPatch_io_outData_bits_3_6),
    .io_outData_bits_3_7(kernelPatch_io_outData_bits_3_7),
    .io_outData_bits_4_0(kernelPatch_io_outData_bits_4_0),
    .io_outData_bits_4_1(kernelPatch_io_outData_bits_4_1),
    .io_outData_bits_4_2(kernelPatch_io_outData_bits_4_2),
    .io_outData_bits_4_3(kernelPatch_io_outData_bits_4_3),
    .io_outData_bits_4_4(kernelPatch_io_outData_bits_4_4),
    .io_outData_bits_4_5(kernelPatch_io_outData_bits_4_5),
    .io_outData_bits_4_6(kernelPatch_io_outData_bits_4_6),
    .io_outData_bits_4_7(kernelPatch_io_outData_bits_4_7),
    .io_outData_bits_5_0(kernelPatch_io_outData_bits_5_0),
    .io_outData_bits_5_1(kernelPatch_io_outData_bits_5_1),
    .io_outData_bits_5_2(kernelPatch_io_outData_bits_5_2),
    .io_outData_bits_5_3(kernelPatch_io_outData_bits_5_3),
    .io_outData_bits_5_4(kernelPatch_io_outData_bits_5_4),
    .io_outData_bits_5_5(kernelPatch_io_outData_bits_5_5),
    .io_outData_bits_5_6(kernelPatch_io_outData_bits_5_6),
    .io_outData_bits_5_7(kernelPatch_io_outData_bits_5_7),
    .io_outData_bits_6_0(kernelPatch_io_outData_bits_6_0),
    .io_outData_bits_6_1(kernelPatch_io_outData_bits_6_1),
    .io_outData_bits_6_2(kernelPatch_io_outData_bits_6_2),
    .io_outData_bits_6_3(kernelPatch_io_outData_bits_6_3),
    .io_outData_bits_6_4(kernelPatch_io_outData_bits_6_4),
    .io_outData_bits_6_5(kernelPatch_io_outData_bits_6_5),
    .io_outData_bits_6_6(kernelPatch_io_outData_bits_6_6),
    .io_outData_bits_6_7(kernelPatch_io_outData_bits_6_7),
    .io_outData_bits_7_0(kernelPatch_io_outData_bits_7_0),
    .io_outData_bits_7_1(kernelPatch_io_outData_bits_7_1),
    .io_outData_bits_7_2(kernelPatch_io_outData_bits_7_2),
    .io_outData_bits_7_3(kernelPatch_io_outData_bits_7_3),
    .io_outData_bits_7_4(kernelPatch_io_outData_bits_7_4),
    .io_outData_bits_7_5(kernelPatch_io_outData_bits_7_5),
    .io_outData_bits_7_6(kernelPatch_io_outData_bits_7_6),
    .io_outData_bits_7_7(kernelPatch_io_outData_bits_7_7)
  );
  assign io_outData_0_0 = kernelPatch_io_outData_bits_0_0; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_0_1 = kernelPatch_io_outData_bits_0_1; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_0_2 = kernelPatch_io_outData_bits_0_2; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_0_3 = kernelPatch_io_outData_bits_0_3; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_0_4 = kernelPatch_io_outData_bits_0_4; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_0_5 = kernelPatch_io_outData_bits_0_5; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_0_6 = kernelPatch_io_outData_bits_0_6; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_0_7 = kernelPatch_io_outData_bits_0_7; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_1_0 = kernelPatch_io_outData_bits_1_0; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_1_1 = kernelPatch_io_outData_bits_1_1; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_1_2 = kernelPatch_io_outData_bits_1_2; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_1_3 = kernelPatch_io_outData_bits_1_3; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_1_4 = kernelPatch_io_outData_bits_1_4; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_1_5 = kernelPatch_io_outData_bits_1_5; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_1_6 = kernelPatch_io_outData_bits_1_6; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_1_7 = kernelPatch_io_outData_bits_1_7; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_2_0 = kernelPatch_io_outData_bits_2_0; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_2_1 = kernelPatch_io_outData_bits_2_1; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_2_2 = kernelPatch_io_outData_bits_2_2; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_2_3 = kernelPatch_io_outData_bits_2_3; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_2_4 = kernelPatch_io_outData_bits_2_4; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_2_5 = kernelPatch_io_outData_bits_2_5; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_2_6 = kernelPatch_io_outData_bits_2_6; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_2_7 = kernelPatch_io_outData_bits_2_7; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_3_0 = kernelPatch_io_outData_bits_3_0; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_3_1 = kernelPatch_io_outData_bits_3_1; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_3_2 = kernelPatch_io_outData_bits_3_2; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_3_3 = kernelPatch_io_outData_bits_3_3; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_3_4 = kernelPatch_io_outData_bits_3_4; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_3_5 = kernelPatch_io_outData_bits_3_5; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_3_6 = kernelPatch_io_outData_bits_3_6; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_3_7 = kernelPatch_io_outData_bits_3_7; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_4_0 = kernelPatch_io_outData_bits_4_0; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_4_1 = kernelPatch_io_outData_bits_4_1; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_4_2 = kernelPatch_io_outData_bits_4_2; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_4_3 = kernelPatch_io_outData_bits_4_3; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_4_4 = kernelPatch_io_outData_bits_4_4; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_4_5 = kernelPatch_io_outData_bits_4_5; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_4_6 = kernelPatch_io_outData_bits_4_6; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_4_7 = kernelPatch_io_outData_bits_4_7; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_5_0 = kernelPatch_io_outData_bits_5_0; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_5_1 = kernelPatch_io_outData_bits_5_1; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_5_2 = kernelPatch_io_outData_bits_5_2; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_5_3 = kernelPatch_io_outData_bits_5_3; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_5_4 = kernelPatch_io_outData_bits_5_4; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_5_5 = kernelPatch_io_outData_bits_5_5; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_5_6 = kernelPatch_io_outData_bits_5_6; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_5_7 = kernelPatch_io_outData_bits_5_7; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_6_0 = kernelPatch_io_outData_bits_6_0; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_6_1 = kernelPatch_io_outData_bits_6_1; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_6_2 = kernelPatch_io_outData_bits_6_2; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_6_3 = kernelPatch_io_outData_bits_6_3; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_6_4 = kernelPatch_io_outData_bits_6_4; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_6_5 = kernelPatch_io_outData_bits_6_5; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_6_6 = kernelPatch_io_outData_bits_6_6; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_6_7 = kernelPatch_io_outData_bits_6_7; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_7_0 = kernelPatch_io_outData_bits_7_0; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_7_1 = kernelPatch_io_outData_bits_7_1; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_7_2 = kernelPatch_io_outData_bits_7_2; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_7_3 = kernelPatch_io_outData_bits_7_3; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_7_4 = kernelPatch_io_outData_bits_7_4; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_7_5 = kernelPatch_io_outData_bits_7_5; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_7_6 = kernelPatch_io_outData_bits_7_6; // @[Im2KernelPatch.scala 25:22]
  assign io_outData_7_7 = kernelPatch_io_outData_bits_7_7; // @[Im2KernelPatch.scala 25:22]
  assign lineBuffer_clock = clock;
  assign lineBuffer_reset = reset;
  assign lineBuffer_io_inData_valid = io_inData_valid; // @[Im2KernelPatch.scala 15:24]
  assign lineBuffer_io_inData_bits_0 = io_inData_bits_0; // @[Im2KernelPatch.scala 15:24]
  assign lineBuffer_io_inData_bits_1 = io_inData_bits_1; // @[Im2KernelPatch.scala 15:24]
  assign lineBuffer_io_inData_bits_2 = io_inData_bits_2; // @[Im2KernelPatch.scala 15:24]
  assign lineBuffer_io_inData_bits_3 = io_inData_bits_3; // @[Im2KernelPatch.scala 15:24]
  assign lineBuffer_io_inData_bits_4 = io_inData_bits_4; // @[Im2KernelPatch.scala 15:24]
  assign lineBuffer_io_inData_bits_5 = io_inData_bits_5; // @[Im2KernelPatch.scala 15:24]
  assign lineBuffer_io_inData_bits_6 = io_inData_bits_6; // @[Im2KernelPatch.scala 15:24]
  assign lineBuffer_io_inData_bits_7 = io_inData_bits_7; // @[Im2KernelPatch.scala 15:24]
  assign lineBuffer_io_inData_bits_8 = io_inData_bits_8; // @[Im2KernelPatch.scala 15:24]
  assign lineBuffer_io_inData_bits_9 = io_inData_bits_9; // @[Im2KernelPatch.scala 15:24]
  assign kernelPatch_clock = clock;
  assign kernelPatch_reset = ~lineBuffer_io_outData_valid | reset; // @[Im2KernelPatch.scala 18:38 Im2KernelPatch.scala 19:23]
  assign kernelPatch_io_inData_bits_0 = lineBuffer_io_outData_bits_0; // @[Im2KernelPatch.scala 16:25]
  assign kernelPatch_io_inData_bits_1 = lineBuffer_io_outData_bits_1; // @[Im2KernelPatch.scala 16:25]
  assign kernelPatch_io_inData_bits_2 = lineBuffer_io_outData_bits_2; // @[Im2KernelPatch.scala 16:25]
  assign kernelPatch_io_inData_bits_3 = lineBuffer_io_outData_bits_3; // @[Im2KernelPatch.scala 16:25]
  assign kernelPatch_io_inData_bits_4 = lineBuffer_io_outData_bits_4; // @[Im2KernelPatch.scala 16:25]
  assign kernelPatch_io_inData_bits_5 = lineBuffer_io_outData_bits_5; // @[Im2KernelPatch.scala 16:25]
  assign kernelPatch_io_inData_bits_6 = lineBuffer_io_outData_bits_6; // @[Im2KernelPatch.scala 16:25]
  assign kernelPatch_io_inData_bits_7 = lineBuffer_io_outData_bits_7; // @[Im2KernelPatch.scala 16:25]
endmodule
module Im2ColMine(
  input         clock,
  input         reset,
  input         io_inData_valid,
  input  [31:0] io_inData_bits_0,
  input  [31:0] io_inData_bits_1,
  input  [31:0] io_inData_bits_2,
  input  [31:0] io_inData_bits_3,
  input  [31:0] io_inData_bits_4,
  input  [31:0] io_inData_bits_5,
  input  [31:0] io_inData_bits_6,
  input  [31:0] io_inData_bits_7,
  input  [31:0] io_inData_bits_8,
  input  [31:0] io_inData_bits_9,
  output [31:0] io_outData_0,
  output [31:0] io_outData_1,
  output [31:0] io_outData_2,
  output [31:0] io_outData_3,
  output [31:0] io_outData_4,
  output [31:0] io_outData_5,
  output [31:0] io_outData_6,
  output [31:0] io_outData_7,
  output [31:0] io_outData_8,
  output [31:0] io_outData_9,
  output [31:0] io_outData_10,
  output [31:0] io_outData_11,
  output [31:0] io_outData_12,
  output [31:0] io_outData_13,
  output [31:0] io_outData_14,
  output [31:0] io_outData_15,
  output [31:0] io_outData_16,
  output [31:0] io_outData_17,
  output [31:0] io_outData_18,
  output [31:0] io_outData_19,
  output [31:0] io_outData_20,
  output [31:0] io_outData_21,
  output [31:0] io_outData_22,
  output [31:0] io_outData_23,
  output [31:0] io_outData_24,
  output [31:0] io_outData_25,
  output [31:0] io_outData_26,
  output [31:0] io_outData_27,
  output [31:0] io_outData_28,
  output [31:0] io_outData_29,
  output [31:0] io_outData_30,
  output [31:0] io_outData_31,
  output [31:0] io_outData_32,
  output [31:0] io_outData_33,
  output [31:0] io_outData_34,
  output [31:0] io_outData_35,
  output [31:0] io_outData_36,
  output [31:0] io_outData_37,
  output [31:0] io_outData_38,
  output [31:0] io_outData_39,
  output [31:0] io_outData_40,
  output [31:0] io_outData_41,
  output [31:0] io_outData_42,
  output [31:0] io_outData_43,
  output [31:0] io_outData_44,
  output [31:0] io_outData_45,
  output [31:0] io_outData_46,
  output [31:0] io_outData_47,
  output [31:0] io_outData_48,
  output [31:0] io_outData_49,
  output [31:0] io_outData_50,
  output [31:0] io_outData_51,
  output [31:0] io_outData_52,
  output [31:0] io_outData_53,
  output [31:0] io_outData_54,
  output [31:0] io_outData_55,
  output [31:0] io_outData_56,
  output [31:0] io_outData_57,
  output [31:0] io_outData_58,
  output [31:0] io_outData_59,
  output [31:0] io_outData_60,
  output [31:0] io_outData_61,
  output [31:0] io_outData_62,
  output [31:0] io_outData_63
);
  wire  im2KernelPatch_clock; // @[Im2ColMine.scala 14:30]
  wire  im2KernelPatch_reset; // @[Im2ColMine.scala 14:30]
  wire  im2KernelPatch_io_inData_valid; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_inData_bits_0; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_inData_bits_1; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_inData_bits_2; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_inData_bits_3; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_inData_bits_4; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_inData_bits_5; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_inData_bits_6; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_inData_bits_7; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_inData_bits_8; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_inData_bits_9; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_0_0; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_0_1; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_0_2; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_0_3; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_0_4; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_0_5; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_0_6; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_0_7; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_1_0; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_1_1; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_1_2; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_1_3; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_1_4; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_1_5; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_1_6; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_1_7; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_2_0; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_2_1; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_2_2; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_2_3; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_2_4; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_2_5; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_2_6; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_2_7; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_3_0; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_3_1; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_3_2; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_3_3; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_3_4; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_3_5; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_3_6; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_3_7; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_4_0; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_4_1; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_4_2; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_4_3; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_4_4; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_4_5; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_4_6; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_4_7; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_5_0; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_5_1; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_5_2; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_5_3; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_5_4; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_5_5; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_5_6; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_5_7; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_6_0; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_6_1; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_6_2; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_6_3; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_6_4; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_6_5; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_6_6; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_6_7; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_7_0; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_7_1; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_7_2; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_7_3; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_7_4; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_7_5; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_7_6; // @[Im2ColMine.scala 14:30]
  wire [31:0] im2KernelPatch_io_outData_7_7; // @[Im2ColMine.scala 14:30]
  Im2KernelPatch im2KernelPatch ( // @[Im2ColMine.scala 14:30]
    .clock(im2KernelPatch_clock),
    .reset(im2KernelPatch_reset),
    .io_inData_valid(im2KernelPatch_io_inData_valid),
    .io_inData_bits_0(im2KernelPatch_io_inData_bits_0),
    .io_inData_bits_1(im2KernelPatch_io_inData_bits_1),
    .io_inData_bits_2(im2KernelPatch_io_inData_bits_2),
    .io_inData_bits_3(im2KernelPatch_io_inData_bits_3),
    .io_inData_bits_4(im2KernelPatch_io_inData_bits_4),
    .io_inData_bits_5(im2KernelPatch_io_inData_bits_5),
    .io_inData_bits_6(im2KernelPatch_io_inData_bits_6),
    .io_inData_bits_7(im2KernelPatch_io_inData_bits_7),
    .io_inData_bits_8(im2KernelPatch_io_inData_bits_8),
    .io_inData_bits_9(im2KernelPatch_io_inData_bits_9),
    .io_outData_0_0(im2KernelPatch_io_outData_0_0),
    .io_outData_0_1(im2KernelPatch_io_outData_0_1),
    .io_outData_0_2(im2KernelPatch_io_outData_0_2),
    .io_outData_0_3(im2KernelPatch_io_outData_0_3),
    .io_outData_0_4(im2KernelPatch_io_outData_0_4),
    .io_outData_0_5(im2KernelPatch_io_outData_0_5),
    .io_outData_0_6(im2KernelPatch_io_outData_0_6),
    .io_outData_0_7(im2KernelPatch_io_outData_0_7),
    .io_outData_1_0(im2KernelPatch_io_outData_1_0),
    .io_outData_1_1(im2KernelPatch_io_outData_1_1),
    .io_outData_1_2(im2KernelPatch_io_outData_1_2),
    .io_outData_1_3(im2KernelPatch_io_outData_1_3),
    .io_outData_1_4(im2KernelPatch_io_outData_1_4),
    .io_outData_1_5(im2KernelPatch_io_outData_1_5),
    .io_outData_1_6(im2KernelPatch_io_outData_1_6),
    .io_outData_1_7(im2KernelPatch_io_outData_1_7),
    .io_outData_2_0(im2KernelPatch_io_outData_2_0),
    .io_outData_2_1(im2KernelPatch_io_outData_2_1),
    .io_outData_2_2(im2KernelPatch_io_outData_2_2),
    .io_outData_2_3(im2KernelPatch_io_outData_2_3),
    .io_outData_2_4(im2KernelPatch_io_outData_2_4),
    .io_outData_2_5(im2KernelPatch_io_outData_2_5),
    .io_outData_2_6(im2KernelPatch_io_outData_2_6),
    .io_outData_2_7(im2KernelPatch_io_outData_2_7),
    .io_outData_3_0(im2KernelPatch_io_outData_3_0),
    .io_outData_3_1(im2KernelPatch_io_outData_3_1),
    .io_outData_3_2(im2KernelPatch_io_outData_3_2),
    .io_outData_3_3(im2KernelPatch_io_outData_3_3),
    .io_outData_3_4(im2KernelPatch_io_outData_3_4),
    .io_outData_3_5(im2KernelPatch_io_outData_3_5),
    .io_outData_3_6(im2KernelPatch_io_outData_3_6),
    .io_outData_3_7(im2KernelPatch_io_outData_3_7),
    .io_outData_4_0(im2KernelPatch_io_outData_4_0),
    .io_outData_4_1(im2KernelPatch_io_outData_4_1),
    .io_outData_4_2(im2KernelPatch_io_outData_4_2),
    .io_outData_4_3(im2KernelPatch_io_outData_4_3),
    .io_outData_4_4(im2KernelPatch_io_outData_4_4),
    .io_outData_4_5(im2KernelPatch_io_outData_4_5),
    .io_outData_4_6(im2KernelPatch_io_outData_4_6),
    .io_outData_4_7(im2KernelPatch_io_outData_4_7),
    .io_outData_5_0(im2KernelPatch_io_outData_5_0),
    .io_outData_5_1(im2KernelPatch_io_outData_5_1),
    .io_outData_5_2(im2KernelPatch_io_outData_5_2),
    .io_outData_5_3(im2KernelPatch_io_outData_5_3),
    .io_outData_5_4(im2KernelPatch_io_outData_5_4),
    .io_outData_5_5(im2KernelPatch_io_outData_5_5),
    .io_outData_5_6(im2KernelPatch_io_outData_5_6),
    .io_outData_5_7(im2KernelPatch_io_outData_5_7),
    .io_outData_6_0(im2KernelPatch_io_outData_6_0),
    .io_outData_6_1(im2KernelPatch_io_outData_6_1),
    .io_outData_6_2(im2KernelPatch_io_outData_6_2),
    .io_outData_6_3(im2KernelPatch_io_outData_6_3),
    .io_outData_6_4(im2KernelPatch_io_outData_6_4),
    .io_outData_6_5(im2KernelPatch_io_outData_6_5),
    .io_outData_6_6(im2KernelPatch_io_outData_6_6),
    .io_outData_6_7(im2KernelPatch_io_outData_6_7),
    .io_outData_7_0(im2KernelPatch_io_outData_7_0),
    .io_outData_7_1(im2KernelPatch_io_outData_7_1),
    .io_outData_7_2(im2KernelPatch_io_outData_7_2),
    .io_outData_7_3(im2KernelPatch_io_outData_7_3),
    .io_outData_7_4(im2KernelPatch_io_outData_7_4),
    .io_outData_7_5(im2KernelPatch_io_outData_7_5),
    .io_outData_7_6(im2KernelPatch_io_outData_7_6),
    .io_outData_7_7(im2KernelPatch_io_outData_7_7)
  );
  assign io_outData_0 = im2KernelPatch_io_outData_7_7; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_1 = im2KernelPatch_io_outData_6_7; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_2 = im2KernelPatch_io_outData_5_7; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_3 = im2KernelPatch_io_outData_4_7; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_4 = im2KernelPatch_io_outData_3_7; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_5 = im2KernelPatch_io_outData_2_7; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_6 = im2KernelPatch_io_outData_1_7; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_7 = im2KernelPatch_io_outData_0_7; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_8 = im2KernelPatch_io_outData_7_6; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_9 = im2KernelPatch_io_outData_6_6; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_10 = im2KernelPatch_io_outData_5_6; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_11 = im2KernelPatch_io_outData_4_6; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_12 = im2KernelPatch_io_outData_3_6; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_13 = im2KernelPatch_io_outData_2_6; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_14 = im2KernelPatch_io_outData_1_6; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_15 = im2KernelPatch_io_outData_0_6; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_16 = im2KernelPatch_io_outData_7_5; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_17 = im2KernelPatch_io_outData_6_5; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_18 = im2KernelPatch_io_outData_5_5; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_19 = im2KernelPatch_io_outData_4_5; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_20 = im2KernelPatch_io_outData_3_5; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_21 = im2KernelPatch_io_outData_2_5; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_22 = im2KernelPatch_io_outData_1_5; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_23 = im2KernelPatch_io_outData_0_5; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_24 = im2KernelPatch_io_outData_7_4; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_25 = im2KernelPatch_io_outData_6_4; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_26 = im2KernelPatch_io_outData_5_4; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_27 = im2KernelPatch_io_outData_4_4; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_28 = im2KernelPatch_io_outData_3_4; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_29 = im2KernelPatch_io_outData_2_4; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_30 = im2KernelPatch_io_outData_1_4; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_31 = im2KernelPatch_io_outData_0_4; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_32 = im2KernelPatch_io_outData_7_3; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_33 = im2KernelPatch_io_outData_6_3; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_34 = im2KernelPatch_io_outData_5_3; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_35 = im2KernelPatch_io_outData_4_3; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_36 = im2KernelPatch_io_outData_3_3; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_37 = im2KernelPatch_io_outData_2_3; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_38 = im2KernelPatch_io_outData_1_3; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_39 = im2KernelPatch_io_outData_0_3; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_40 = im2KernelPatch_io_outData_7_2; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_41 = im2KernelPatch_io_outData_6_2; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_42 = im2KernelPatch_io_outData_5_2; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_43 = im2KernelPatch_io_outData_4_2; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_44 = im2KernelPatch_io_outData_3_2; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_45 = im2KernelPatch_io_outData_2_2; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_46 = im2KernelPatch_io_outData_1_2; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_47 = im2KernelPatch_io_outData_0_2; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_48 = im2KernelPatch_io_outData_7_1; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_49 = im2KernelPatch_io_outData_6_1; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_50 = im2KernelPatch_io_outData_5_1; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_51 = im2KernelPatch_io_outData_4_1; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_52 = im2KernelPatch_io_outData_3_1; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_53 = im2KernelPatch_io_outData_2_1; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_54 = im2KernelPatch_io_outData_1_1; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_55 = im2KernelPatch_io_outData_0_1; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_56 = im2KernelPatch_io_outData_7_0; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_57 = im2KernelPatch_io_outData_6_0; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_58 = im2KernelPatch_io_outData_5_0; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_59 = im2KernelPatch_io_outData_4_0; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_60 = im2KernelPatch_io_outData_3_0; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_61 = im2KernelPatch_io_outData_2_0; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_62 = im2KernelPatch_io_outData_1_0; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign io_outData_63 = im2KernelPatch_io_outData_0_0; // @[Im2ColMine.scala 17:25 Im2ColMine.scala 21:32]
  assign im2KernelPatch_clock = clock;
  assign im2KernelPatch_reset = reset;
  assign im2KernelPatch_io_inData_valid = io_inData_valid; // @[Im2ColMine.scala 15:28]
  assign im2KernelPatch_io_inData_bits_0 = io_inData_bits_0; // @[Im2ColMine.scala 15:28]
  assign im2KernelPatch_io_inData_bits_1 = io_inData_bits_1; // @[Im2ColMine.scala 15:28]
  assign im2KernelPatch_io_inData_bits_2 = io_inData_bits_2; // @[Im2ColMine.scala 15:28]
  assign im2KernelPatch_io_inData_bits_3 = io_inData_bits_3; // @[Im2ColMine.scala 15:28]
  assign im2KernelPatch_io_inData_bits_4 = io_inData_bits_4; // @[Im2ColMine.scala 15:28]
  assign im2KernelPatch_io_inData_bits_5 = io_inData_bits_5; // @[Im2ColMine.scala 15:28]
  assign im2KernelPatch_io_inData_bits_6 = io_inData_bits_6; // @[Im2ColMine.scala 15:28]
  assign im2KernelPatch_io_inData_bits_7 = io_inData_bits_7; // @[Im2ColMine.scala 15:28]
  assign im2KernelPatch_io_inData_bits_8 = io_inData_bits_8; // @[Im2ColMine.scala 15:28]
  assign im2KernelPatch_io_inData_bits_9 = io_inData_bits_9; // @[Im2ColMine.scala 15:28]
endmodule
module MAC(
  input         clock,
  input  [31:0] io_a,
  input  [31:0] io_b,
  output [64:0] io_y
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] rA; // @[Adder.scala 21:19]
  reg [31:0] rB; // @[Adder.scala 22:19]
  wire [63:0] mult = rA * rB; // @[Adder.scala 25:14]
  assign io_y = {{1'd0}, mult}; // @[Adder.scala 26:13]
  always @(posedge clock) begin
    rA <= io_a; // @[Adder.scala 21:19]
    rB <= io_b; // @[Adder.scala 22:19]
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
  rA = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  rB = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipeAdder(
  input          clock,
  input  [130:0] io_a,
  input  [130:0] io_b,
  output [131:0] io_y
);
`ifdef RANDOMIZE_REG_INIT
  reg [159:0] _RAND_0;
  reg [159:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [130:0] rA; // @[Adder.scala 47:19]
  reg [130:0] rB; // @[Adder.scala 48:19]
  assign io_y = rA + rB; // @[Adder.scala 49:13]
  always @(posedge clock) begin
    rA <= io_a; // @[Adder.scala 47:19]
    rB <= io_b; // @[Adder.scala 48:19]
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
  _RAND_0 = {5{`RANDOM}};
  rA = _RAND_0[130:0];
  _RAND_1 = {5{`RANDOM}};
  rB = _RAND_1[130:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Adder(
  input  [131:0] io_a,
  input  [131:0] io_b,
  output [132:0] io_y
);
  assign io_y = io_a + io_b; // @[Adder.scala 71:13]
endmodule
module Adder_16(
  input  [132:0] io_a,
  input  [132:0] io_b,
  output [133:0] io_y
);
  assign io_y = io_a + io_b; // @[Adder.scala 71:13]
endmodule
module Adder_24(
  input  [133:0] io_a,
  input  [133:0] io_b,
  output [134:0] io_y
);
  assign io_y = io_a + io_b; // @[Adder.scala 71:13]
endmodule
module Adder_28(
  input  [134:0] io_a,
  input  [134:0] io_b,
  output [135:0] io_y
);
  assign io_y = io_a + io_b; // @[Adder.scala 71:13]
endmodule
module Adder_30(
  input  [135:0] io_a,
  input  [135:0] io_b,
  output [136:0] io_y
);
  assign io_y = io_a + io_b; // @[Adder.scala 71:13]
endmodule
module LogSum(
  input          clock,
  input  [64:0]  io_inVec_0,
  input  [64:0]  io_inVec_1,
  input  [64:0]  io_inVec_2,
  input  [64:0]  io_inVec_3,
  input  [64:0]  io_inVec_4,
  input  [64:0]  io_inVec_5,
  input  [64:0]  io_inVec_6,
  input  [64:0]  io_inVec_7,
  input  [64:0]  io_inVec_8,
  input  [64:0]  io_inVec_9,
  input  [64:0]  io_inVec_10,
  input  [64:0]  io_inVec_11,
  input  [64:0]  io_inVec_12,
  input  [64:0]  io_inVec_13,
  input  [64:0]  io_inVec_14,
  input  [64:0]  io_inVec_15,
  input  [64:0]  io_inVec_16,
  input  [64:0]  io_inVec_17,
  input  [64:0]  io_inVec_18,
  input  [64:0]  io_inVec_19,
  input  [64:0]  io_inVec_20,
  input  [64:0]  io_inVec_21,
  input  [64:0]  io_inVec_22,
  input  [64:0]  io_inVec_23,
  input  [64:0]  io_inVec_24,
  input  [64:0]  io_inVec_25,
  input  [64:0]  io_inVec_26,
  input  [64:0]  io_inVec_27,
  input  [64:0]  io_inVec_28,
  input  [64:0]  io_inVec_29,
  input  [64:0]  io_inVec_30,
  input  [64:0]  io_inVec_31,
  input  [64:0]  io_inVec_32,
  input  [64:0]  io_inVec_33,
  input  [64:0]  io_inVec_34,
  input  [64:0]  io_inVec_35,
  input  [64:0]  io_inVec_36,
  input  [64:0]  io_inVec_37,
  input  [64:0]  io_inVec_38,
  input  [64:0]  io_inVec_39,
  input  [64:0]  io_inVec_40,
  input  [64:0]  io_inVec_41,
  input  [64:0]  io_inVec_42,
  input  [64:0]  io_inVec_43,
  input  [64:0]  io_inVec_44,
  input  [64:0]  io_inVec_45,
  input  [64:0]  io_inVec_46,
  input  [64:0]  io_inVec_47,
  input  [64:0]  io_inVec_48,
  input  [64:0]  io_inVec_49,
  input  [64:0]  io_inVec_50,
  input  [64:0]  io_inVec_51,
  input  [64:0]  io_inVec_52,
  input  [64:0]  io_inVec_53,
  input  [64:0]  io_inVec_54,
  input  [64:0]  io_inVec_55,
  input  [64:0]  io_inVec_56,
  input  [64:0]  io_inVec_57,
  input  [64:0]  io_inVec_58,
  input  [64:0]  io_inVec_59,
  input  [64:0]  io_inVec_60,
  input  [64:0]  io_inVec_61,
  input  [64:0]  io_inVec_62,
  input  [64:0]  io_inVec_63,
  output [136:0] io_y
);
  wire  PipeAdder_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_1_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_1_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_1_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_1_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_2_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_2_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_2_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_2_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_3_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_3_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_3_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_3_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_4_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_4_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_4_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_4_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_5_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_5_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_5_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_5_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_6_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_6_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_6_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_6_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_7_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_7_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_7_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_7_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_8_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_8_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_8_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_8_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_9_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_9_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_9_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_9_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_10_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_10_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_10_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_10_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_11_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_11_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_11_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_11_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_12_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_12_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_12_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_12_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_13_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_13_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_13_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_13_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_14_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_14_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_14_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_14_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_15_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_15_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_15_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_15_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_16_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_16_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_16_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_16_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_17_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_17_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_17_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_17_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_18_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_18_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_18_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_18_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_19_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_19_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_19_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_19_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_20_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_20_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_20_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_20_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_21_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_21_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_21_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_21_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_22_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_22_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_22_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_22_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_23_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_23_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_23_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_23_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_24_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_24_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_24_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_24_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_25_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_25_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_25_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_25_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_26_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_26_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_26_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_26_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_27_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_27_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_27_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_27_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_28_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_28_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_28_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_28_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_29_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_29_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_29_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_29_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_30_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_30_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_30_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_30_io_y; // @[Adder.scala 91:20]
  wire  PipeAdder_31_clock; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_31_io_a; // @[Adder.scala 91:20]
  wire [130:0] PipeAdder_31_io_b; // @[Adder.scala 91:20]
  wire [131:0] PipeAdder_31_io_y; // @[Adder.scala 91:20]
  wire [131:0] Adder_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_1_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_1_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_1_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_2_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_2_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_2_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_3_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_3_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_3_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_4_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_4_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_4_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_5_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_5_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_5_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_6_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_6_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_6_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_7_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_7_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_7_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_8_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_8_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_8_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_9_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_9_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_9_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_10_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_10_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_10_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_11_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_11_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_11_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_12_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_12_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_12_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_13_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_13_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_13_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_14_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_14_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_14_io_y; // @[Adder.scala 93:21]
  wire [131:0] Adder_15_io_a; // @[Adder.scala 93:21]
  wire [131:0] Adder_15_io_b; // @[Adder.scala 93:21]
  wire [132:0] Adder_15_io_y; // @[Adder.scala 93:21]
  wire [132:0] Adder_16_io_a; // @[Adder.scala 93:21]
  wire [132:0] Adder_16_io_b; // @[Adder.scala 93:21]
  wire [133:0] Adder_16_io_y; // @[Adder.scala 93:21]
  wire [132:0] Adder_17_io_a; // @[Adder.scala 93:21]
  wire [132:0] Adder_17_io_b; // @[Adder.scala 93:21]
  wire [133:0] Adder_17_io_y; // @[Adder.scala 93:21]
  wire [132:0] Adder_18_io_a; // @[Adder.scala 93:21]
  wire [132:0] Adder_18_io_b; // @[Adder.scala 93:21]
  wire [133:0] Adder_18_io_y; // @[Adder.scala 93:21]
  wire [132:0] Adder_19_io_a; // @[Adder.scala 93:21]
  wire [132:0] Adder_19_io_b; // @[Adder.scala 93:21]
  wire [133:0] Adder_19_io_y; // @[Adder.scala 93:21]
  wire [132:0] Adder_20_io_a; // @[Adder.scala 93:21]
  wire [132:0] Adder_20_io_b; // @[Adder.scala 93:21]
  wire [133:0] Adder_20_io_y; // @[Adder.scala 93:21]
  wire [132:0] Adder_21_io_a; // @[Adder.scala 93:21]
  wire [132:0] Adder_21_io_b; // @[Adder.scala 93:21]
  wire [133:0] Adder_21_io_y; // @[Adder.scala 93:21]
  wire [132:0] Adder_22_io_a; // @[Adder.scala 93:21]
  wire [132:0] Adder_22_io_b; // @[Adder.scala 93:21]
  wire [133:0] Adder_22_io_y; // @[Adder.scala 93:21]
  wire [132:0] Adder_23_io_a; // @[Adder.scala 93:21]
  wire [132:0] Adder_23_io_b; // @[Adder.scala 93:21]
  wire [133:0] Adder_23_io_y; // @[Adder.scala 93:21]
  wire [133:0] Adder_24_io_a; // @[Adder.scala 93:21]
  wire [133:0] Adder_24_io_b; // @[Adder.scala 93:21]
  wire [134:0] Adder_24_io_y; // @[Adder.scala 93:21]
  wire [133:0] Adder_25_io_a; // @[Adder.scala 93:21]
  wire [133:0] Adder_25_io_b; // @[Adder.scala 93:21]
  wire [134:0] Adder_25_io_y; // @[Adder.scala 93:21]
  wire [133:0] Adder_26_io_a; // @[Adder.scala 93:21]
  wire [133:0] Adder_26_io_b; // @[Adder.scala 93:21]
  wire [134:0] Adder_26_io_y; // @[Adder.scala 93:21]
  wire [133:0] Adder_27_io_a; // @[Adder.scala 93:21]
  wire [133:0] Adder_27_io_b; // @[Adder.scala 93:21]
  wire [134:0] Adder_27_io_y; // @[Adder.scala 93:21]
  wire [134:0] Adder_28_io_a; // @[Adder.scala 93:21]
  wire [134:0] Adder_28_io_b; // @[Adder.scala 93:21]
  wire [135:0] Adder_28_io_y; // @[Adder.scala 93:21]
  wire [134:0] Adder_29_io_a; // @[Adder.scala 93:21]
  wire [134:0] Adder_29_io_b; // @[Adder.scala 93:21]
  wire [135:0] Adder_29_io_y; // @[Adder.scala 93:21]
  wire [135:0] Adder_30_io_a; // @[Adder.scala 93:21]
  wire [135:0] Adder_30_io_b; // @[Adder.scala 93:21]
  wire [136:0] Adder_30_io_y; // @[Adder.scala 93:21]
  PipeAdder PipeAdder ( // @[Adder.scala 91:20]
    .clock(PipeAdder_clock),
    .io_a(PipeAdder_io_a),
    .io_b(PipeAdder_io_b),
    .io_y(PipeAdder_io_y)
  );
  PipeAdder PipeAdder_1 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_1_clock),
    .io_a(PipeAdder_1_io_a),
    .io_b(PipeAdder_1_io_b),
    .io_y(PipeAdder_1_io_y)
  );
  PipeAdder PipeAdder_2 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_2_clock),
    .io_a(PipeAdder_2_io_a),
    .io_b(PipeAdder_2_io_b),
    .io_y(PipeAdder_2_io_y)
  );
  PipeAdder PipeAdder_3 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_3_clock),
    .io_a(PipeAdder_3_io_a),
    .io_b(PipeAdder_3_io_b),
    .io_y(PipeAdder_3_io_y)
  );
  PipeAdder PipeAdder_4 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_4_clock),
    .io_a(PipeAdder_4_io_a),
    .io_b(PipeAdder_4_io_b),
    .io_y(PipeAdder_4_io_y)
  );
  PipeAdder PipeAdder_5 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_5_clock),
    .io_a(PipeAdder_5_io_a),
    .io_b(PipeAdder_5_io_b),
    .io_y(PipeAdder_5_io_y)
  );
  PipeAdder PipeAdder_6 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_6_clock),
    .io_a(PipeAdder_6_io_a),
    .io_b(PipeAdder_6_io_b),
    .io_y(PipeAdder_6_io_y)
  );
  PipeAdder PipeAdder_7 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_7_clock),
    .io_a(PipeAdder_7_io_a),
    .io_b(PipeAdder_7_io_b),
    .io_y(PipeAdder_7_io_y)
  );
  PipeAdder PipeAdder_8 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_8_clock),
    .io_a(PipeAdder_8_io_a),
    .io_b(PipeAdder_8_io_b),
    .io_y(PipeAdder_8_io_y)
  );
  PipeAdder PipeAdder_9 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_9_clock),
    .io_a(PipeAdder_9_io_a),
    .io_b(PipeAdder_9_io_b),
    .io_y(PipeAdder_9_io_y)
  );
  PipeAdder PipeAdder_10 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_10_clock),
    .io_a(PipeAdder_10_io_a),
    .io_b(PipeAdder_10_io_b),
    .io_y(PipeAdder_10_io_y)
  );
  PipeAdder PipeAdder_11 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_11_clock),
    .io_a(PipeAdder_11_io_a),
    .io_b(PipeAdder_11_io_b),
    .io_y(PipeAdder_11_io_y)
  );
  PipeAdder PipeAdder_12 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_12_clock),
    .io_a(PipeAdder_12_io_a),
    .io_b(PipeAdder_12_io_b),
    .io_y(PipeAdder_12_io_y)
  );
  PipeAdder PipeAdder_13 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_13_clock),
    .io_a(PipeAdder_13_io_a),
    .io_b(PipeAdder_13_io_b),
    .io_y(PipeAdder_13_io_y)
  );
  PipeAdder PipeAdder_14 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_14_clock),
    .io_a(PipeAdder_14_io_a),
    .io_b(PipeAdder_14_io_b),
    .io_y(PipeAdder_14_io_y)
  );
  PipeAdder PipeAdder_15 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_15_clock),
    .io_a(PipeAdder_15_io_a),
    .io_b(PipeAdder_15_io_b),
    .io_y(PipeAdder_15_io_y)
  );
  PipeAdder PipeAdder_16 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_16_clock),
    .io_a(PipeAdder_16_io_a),
    .io_b(PipeAdder_16_io_b),
    .io_y(PipeAdder_16_io_y)
  );
  PipeAdder PipeAdder_17 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_17_clock),
    .io_a(PipeAdder_17_io_a),
    .io_b(PipeAdder_17_io_b),
    .io_y(PipeAdder_17_io_y)
  );
  PipeAdder PipeAdder_18 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_18_clock),
    .io_a(PipeAdder_18_io_a),
    .io_b(PipeAdder_18_io_b),
    .io_y(PipeAdder_18_io_y)
  );
  PipeAdder PipeAdder_19 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_19_clock),
    .io_a(PipeAdder_19_io_a),
    .io_b(PipeAdder_19_io_b),
    .io_y(PipeAdder_19_io_y)
  );
  PipeAdder PipeAdder_20 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_20_clock),
    .io_a(PipeAdder_20_io_a),
    .io_b(PipeAdder_20_io_b),
    .io_y(PipeAdder_20_io_y)
  );
  PipeAdder PipeAdder_21 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_21_clock),
    .io_a(PipeAdder_21_io_a),
    .io_b(PipeAdder_21_io_b),
    .io_y(PipeAdder_21_io_y)
  );
  PipeAdder PipeAdder_22 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_22_clock),
    .io_a(PipeAdder_22_io_a),
    .io_b(PipeAdder_22_io_b),
    .io_y(PipeAdder_22_io_y)
  );
  PipeAdder PipeAdder_23 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_23_clock),
    .io_a(PipeAdder_23_io_a),
    .io_b(PipeAdder_23_io_b),
    .io_y(PipeAdder_23_io_y)
  );
  PipeAdder PipeAdder_24 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_24_clock),
    .io_a(PipeAdder_24_io_a),
    .io_b(PipeAdder_24_io_b),
    .io_y(PipeAdder_24_io_y)
  );
  PipeAdder PipeAdder_25 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_25_clock),
    .io_a(PipeAdder_25_io_a),
    .io_b(PipeAdder_25_io_b),
    .io_y(PipeAdder_25_io_y)
  );
  PipeAdder PipeAdder_26 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_26_clock),
    .io_a(PipeAdder_26_io_a),
    .io_b(PipeAdder_26_io_b),
    .io_y(PipeAdder_26_io_y)
  );
  PipeAdder PipeAdder_27 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_27_clock),
    .io_a(PipeAdder_27_io_a),
    .io_b(PipeAdder_27_io_b),
    .io_y(PipeAdder_27_io_y)
  );
  PipeAdder PipeAdder_28 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_28_clock),
    .io_a(PipeAdder_28_io_a),
    .io_b(PipeAdder_28_io_b),
    .io_y(PipeAdder_28_io_y)
  );
  PipeAdder PipeAdder_29 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_29_clock),
    .io_a(PipeAdder_29_io_a),
    .io_b(PipeAdder_29_io_b),
    .io_y(PipeAdder_29_io_y)
  );
  PipeAdder PipeAdder_30 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_30_clock),
    .io_a(PipeAdder_30_io_a),
    .io_b(PipeAdder_30_io_b),
    .io_y(PipeAdder_30_io_y)
  );
  PipeAdder PipeAdder_31 ( // @[Adder.scala 91:20]
    .clock(PipeAdder_31_clock),
    .io_a(PipeAdder_31_io_a),
    .io_b(PipeAdder_31_io_b),
    .io_y(PipeAdder_31_io_y)
  );
  Adder Adder ( // @[Adder.scala 93:21]
    .io_a(Adder_io_a),
    .io_b(Adder_io_b),
    .io_y(Adder_io_y)
  );
  Adder Adder_1 ( // @[Adder.scala 93:21]
    .io_a(Adder_1_io_a),
    .io_b(Adder_1_io_b),
    .io_y(Adder_1_io_y)
  );
  Adder Adder_2 ( // @[Adder.scala 93:21]
    .io_a(Adder_2_io_a),
    .io_b(Adder_2_io_b),
    .io_y(Adder_2_io_y)
  );
  Adder Adder_3 ( // @[Adder.scala 93:21]
    .io_a(Adder_3_io_a),
    .io_b(Adder_3_io_b),
    .io_y(Adder_3_io_y)
  );
  Adder Adder_4 ( // @[Adder.scala 93:21]
    .io_a(Adder_4_io_a),
    .io_b(Adder_4_io_b),
    .io_y(Adder_4_io_y)
  );
  Adder Adder_5 ( // @[Adder.scala 93:21]
    .io_a(Adder_5_io_a),
    .io_b(Adder_5_io_b),
    .io_y(Adder_5_io_y)
  );
  Adder Adder_6 ( // @[Adder.scala 93:21]
    .io_a(Adder_6_io_a),
    .io_b(Adder_6_io_b),
    .io_y(Adder_6_io_y)
  );
  Adder Adder_7 ( // @[Adder.scala 93:21]
    .io_a(Adder_7_io_a),
    .io_b(Adder_7_io_b),
    .io_y(Adder_7_io_y)
  );
  Adder Adder_8 ( // @[Adder.scala 93:21]
    .io_a(Adder_8_io_a),
    .io_b(Adder_8_io_b),
    .io_y(Adder_8_io_y)
  );
  Adder Adder_9 ( // @[Adder.scala 93:21]
    .io_a(Adder_9_io_a),
    .io_b(Adder_9_io_b),
    .io_y(Adder_9_io_y)
  );
  Adder Adder_10 ( // @[Adder.scala 93:21]
    .io_a(Adder_10_io_a),
    .io_b(Adder_10_io_b),
    .io_y(Adder_10_io_y)
  );
  Adder Adder_11 ( // @[Adder.scala 93:21]
    .io_a(Adder_11_io_a),
    .io_b(Adder_11_io_b),
    .io_y(Adder_11_io_y)
  );
  Adder Adder_12 ( // @[Adder.scala 93:21]
    .io_a(Adder_12_io_a),
    .io_b(Adder_12_io_b),
    .io_y(Adder_12_io_y)
  );
  Adder Adder_13 ( // @[Adder.scala 93:21]
    .io_a(Adder_13_io_a),
    .io_b(Adder_13_io_b),
    .io_y(Adder_13_io_y)
  );
  Adder Adder_14 ( // @[Adder.scala 93:21]
    .io_a(Adder_14_io_a),
    .io_b(Adder_14_io_b),
    .io_y(Adder_14_io_y)
  );
  Adder Adder_15 ( // @[Adder.scala 93:21]
    .io_a(Adder_15_io_a),
    .io_b(Adder_15_io_b),
    .io_y(Adder_15_io_y)
  );
  Adder_16 Adder_16 ( // @[Adder.scala 93:21]
    .io_a(Adder_16_io_a),
    .io_b(Adder_16_io_b),
    .io_y(Adder_16_io_y)
  );
  Adder_16 Adder_17 ( // @[Adder.scala 93:21]
    .io_a(Adder_17_io_a),
    .io_b(Adder_17_io_b),
    .io_y(Adder_17_io_y)
  );
  Adder_16 Adder_18 ( // @[Adder.scala 93:21]
    .io_a(Adder_18_io_a),
    .io_b(Adder_18_io_b),
    .io_y(Adder_18_io_y)
  );
  Adder_16 Adder_19 ( // @[Adder.scala 93:21]
    .io_a(Adder_19_io_a),
    .io_b(Adder_19_io_b),
    .io_y(Adder_19_io_y)
  );
  Adder_16 Adder_20 ( // @[Adder.scala 93:21]
    .io_a(Adder_20_io_a),
    .io_b(Adder_20_io_b),
    .io_y(Adder_20_io_y)
  );
  Adder_16 Adder_21 ( // @[Adder.scala 93:21]
    .io_a(Adder_21_io_a),
    .io_b(Adder_21_io_b),
    .io_y(Adder_21_io_y)
  );
  Adder_16 Adder_22 ( // @[Adder.scala 93:21]
    .io_a(Adder_22_io_a),
    .io_b(Adder_22_io_b),
    .io_y(Adder_22_io_y)
  );
  Adder_16 Adder_23 ( // @[Adder.scala 93:21]
    .io_a(Adder_23_io_a),
    .io_b(Adder_23_io_b),
    .io_y(Adder_23_io_y)
  );
  Adder_24 Adder_24 ( // @[Adder.scala 93:21]
    .io_a(Adder_24_io_a),
    .io_b(Adder_24_io_b),
    .io_y(Adder_24_io_y)
  );
  Adder_24 Adder_25 ( // @[Adder.scala 93:21]
    .io_a(Adder_25_io_a),
    .io_b(Adder_25_io_b),
    .io_y(Adder_25_io_y)
  );
  Adder_24 Adder_26 ( // @[Adder.scala 93:21]
    .io_a(Adder_26_io_a),
    .io_b(Adder_26_io_b),
    .io_y(Adder_26_io_y)
  );
  Adder_24 Adder_27 ( // @[Adder.scala 93:21]
    .io_a(Adder_27_io_a),
    .io_b(Adder_27_io_b),
    .io_y(Adder_27_io_y)
  );
  Adder_28 Adder_28 ( // @[Adder.scala 93:21]
    .io_a(Adder_28_io_a),
    .io_b(Adder_28_io_b),
    .io_y(Adder_28_io_y)
  );
  Adder_28 Adder_29 ( // @[Adder.scala 93:21]
    .io_a(Adder_29_io_a),
    .io_b(Adder_29_io_b),
    .io_y(Adder_29_io_y)
  );
  Adder_30 Adder_30 ( // @[Adder.scala 93:21]
    .io_a(Adder_30_io_a),
    .io_b(Adder_30_io_b),
    .io_y(Adder_30_io_y)
  );
  assign io_y = Adder_30_io_y; // @[Adder.scala 137:12]
  assign PipeAdder_clock = clock;
  assign PipeAdder_io_a = {{66'd0}, io_inVec_0}; // @[Adder.scala 104:26]
  assign PipeAdder_io_b = {{66'd0}, io_inVec_1}; // @[Adder.scala 105:26]
  assign PipeAdder_1_clock = clock;
  assign PipeAdder_1_io_a = {{66'd0}, io_inVec_2}; // @[Adder.scala 104:26]
  assign PipeAdder_1_io_b = {{66'd0}, io_inVec_3}; // @[Adder.scala 105:26]
  assign PipeAdder_2_clock = clock;
  assign PipeAdder_2_io_a = {{66'd0}, io_inVec_4}; // @[Adder.scala 104:26]
  assign PipeAdder_2_io_b = {{66'd0}, io_inVec_5}; // @[Adder.scala 105:26]
  assign PipeAdder_3_clock = clock;
  assign PipeAdder_3_io_a = {{66'd0}, io_inVec_6}; // @[Adder.scala 104:26]
  assign PipeAdder_3_io_b = {{66'd0}, io_inVec_7}; // @[Adder.scala 105:26]
  assign PipeAdder_4_clock = clock;
  assign PipeAdder_4_io_a = {{66'd0}, io_inVec_8}; // @[Adder.scala 104:26]
  assign PipeAdder_4_io_b = {{66'd0}, io_inVec_9}; // @[Adder.scala 105:26]
  assign PipeAdder_5_clock = clock;
  assign PipeAdder_5_io_a = {{66'd0}, io_inVec_10}; // @[Adder.scala 104:26]
  assign PipeAdder_5_io_b = {{66'd0}, io_inVec_11}; // @[Adder.scala 105:26]
  assign PipeAdder_6_clock = clock;
  assign PipeAdder_6_io_a = {{66'd0}, io_inVec_12}; // @[Adder.scala 104:26]
  assign PipeAdder_6_io_b = {{66'd0}, io_inVec_13}; // @[Adder.scala 105:26]
  assign PipeAdder_7_clock = clock;
  assign PipeAdder_7_io_a = {{66'd0}, io_inVec_14}; // @[Adder.scala 104:26]
  assign PipeAdder_7_io_b = {{66'd0}, io_inVec_15}; // @[Adder.scala 105:26]
  assign PipeAdder_8_clock = clock;
  assign PipeAdder_8_io_a = {{66'd0}, io_inVec_16}; // @[Adder.scala 104:26]
  assign PipeAdder_8_io_b = {{66'd0}, io_inVec_17}; // @[Adder.scala 105:26]
  assign PipeAdder_9_clock = clock;
  assign PipeAdder_9_io_a = {{66'd0}, io_inVec_18}; // @[Adder.scala 104:26]
  assign PipeAdder_9_io_b = {{66'd0}, io_inVec_19}; // @[Adder.scala 105:26]
  assign PipeAdder_10_clock = clock;
  assign PipeAdder_10_io_a = {{66'd0}, io_inVec_20}; // @[Adder.scala 104:26]
  assign PipeAdder_10_io_b = {{66'd0}, io_inVec_21}; // @[Adder.scala 105:26]
  assign PipeAdder_11_clock = clock;
  assign PipeAdder_11_io_a = {{66'd0}, io_inVec_22}; // @[Adder.scala 104:26]
  assign PipeAdder_11_io_b = {{66'd0}, io_inVec_23}; // @[Adder.scala 105:26]
  assign PipeAdder_12_clock = clock;
  assign PipeAdder_12_io_a = {{66'd0}, io_inVec_24}; // @[Adder.scala 104:26]
  assign PipeAdder_12_io_b = {{66'd0}, io_inVec_25}; // @[Adder.scala 105:26]
  assign PipeAdder_13_clock = clock;
  assign PipeAdder_13_io_a = {{66'd0}, io_inVec_26}; // @[Adder.scala 104:26]
  assign PipeAdder_13_io_b = {{66'd0}, io_inVec_27}; // @[Adder.scala 105:26]
  assign PipeAdder_14_clock = clock;
  assign PipeAdder_14_io_a = {{66'd0}, io_inVec_28}; // @[Adder.scala 104:26]
  assign PipeAdder_14_io_b = {{66'd0}, io_inVec_29}; // @[Adder.scala 105:26]
  assign PipeAdder_15_clock = clock;
  assign PipeAdder_15_io_a = {{66'd0}, io_inVec_30}; // @[Adder.scala 104:26]
  assign PipeAdder_15_io_b = {{66'd0}, io_inVec_31}; // @[Adder.scala 105:26]
  assign PipeAdder_16_clock = clock;
  assign PipeAdder_16_io_a = {{66'd0}, io_inVec_32}; // @[Adder.scala 104:26]
  assign PipeAdder_16_io_b = {{66'd0}, io_inVec_33}; // @[Adder.scala 105:26]
  assign PipeAdder_17_clock = clock;
  assign PipeAdder_17_io_a = {{66'd0}, io_inVec_34}; // @[Adder.scala 104:26]
  assign PipeAdder_17_io_b = {{66'd0}, io_inVec_35}; // @[Adder.scala 105:26]
  assign PipeAdder_18_clock = clock;
  assign PipeAdder_18_io_a = {{66'd0}, io_inVec_36}; // @[Adder.scala 104:26]
  assign PipeAdder_18_io_b = {{66'd0}, io_inVec_37}; // @[Adder.scala 105:26]
  assign PipeAdder_19_clock = clock;
  assign PipeAdder_19_io_a = {{66'd0}, io_inVec_38}; // @[Adder.scala 104:26]
  assign PipeAdder_19_io_b = {{66'd0}, io_inVec_39}; // @[Adder.scala 105:26]
  assign PipeAdder_20_clock = clock;
  assign PipeAdder_20_io_a = {{66'd0}, io_inVec_40}; // @[Adder.scala 104:26]
  assign PipeAdder_20_io_b = {{66'd0}, io_inVec_41}; // @[Adder.scala 105:26]
  assign PipeAdder_21_clock = clock;
  assign PipeAdder_21_io_a = {{66'd0}, io_inVec_42}; // @[Adder.scala 104:26]
  assign PipeAdder_21_io_b = {{66'd0}, io_inVec_43}; // @[Adder.scala 105:26]
  assign PipeAdder_22_clock = clock;
  assign PipeAdder_22_io_a = {{66'd0}, io_inVec_44}; // @[Adder.scala 104:26]
  assign PipeAdder_22_io_b = {{66'd0}, io_inVec_45}; // @[Adder.scala 105:26]
  assign PipeAdder_23_clock = clock;
  assign PipeAdder_23_io_a = {{66'd0}, io_inVec_46}; // @[Adder.scala 104:26]
  assign PipeAdder_23_io_b = {{66'd0}, io_inVec_47}; // @[Adder.scala 105:26]
  assign PipeAdder_24_clock = clock;
  assign PipeAdder_24_io_a = {{66'd0}, io_inVec_48}; // @[Adder.scala 104:26]
  assign PipeAdder_24_io_b = {{66'd0}, io_inVec_49}; // @[Adder.scala 105:26]
  assign PipeAdder_25_clock = clock;
  assign PipeAdder_25_io_a = {{66'd0}, io_inVec_50}; // @[Adder.scala 104:26]
  assign PipeAdder_25_io_b = {{66'd0}, io_inVec_51}; // @[Adder.scala 105:26]
  assign PipeAdder_26_clock = clock;
  assign PipeAdder_26_io_a = {{66'd0}, io_inVec_52}; // @[Adder.scala 104:26]
  assign PipeAdder_26_io_b = {{66'd0}, io_inVec_53}; // @[Adder.scala 105:26]
  assign PipeAdder_27_clock = clock;
  assign PipeAdder_27_io_a = {{66'd0}, io_inVec_54}; // @[Adder.scala 104:26]
  assign PipeAdder_27_io_b = {{66'd0}, io_inVec_55}; // @[Adder.scala 105:26]
  assign PipeAdder_28_clock = clock;
  assign PipeAdder_28_io_a = {{66'd0}, io_inVec_56}; // @[Adder.scala 104:26]
  assign PipeAdder_28_io_b = {{66'd0}, io_inVec_57}; // @[Adder.scala 105:26]
  assign PipeAdder_29_clock = clock;
  assign PipeAdder_29_io_a = {{66'd0}, io_inVec_58}; // @[Adder.scala 104:26]
  assign PipeAdder_29_io_b = {{66'd0}, io_inVec_59}; // @[Adder.scala 105:26]
  assign PipeAdder_30_clock = clock;
  assign PipeAdder_30_io_a = {{66'd0}, io_inVec_60}; // @[Adder.scala 104:26]
  assign PipeAdder_30_io_b = {{66'd0}, io_inVec_61}; // @[Adder.scala 105:26]
  assign PipeAdder_31_clock = clock;
  assign PipeAdder_31_io_a = {{66'd0}, io_inVec_62}; // @[Adder.scala 104:26]
  assign PipeAdder_31_io_b = {{66'd0}, io_inVec_63}; // @[Adder.scala 105:26]
  assign Adder_io_a = PipeAdder_io_y; // @[Adder.scala 111:30]
  assign Adder_io_b = PipeAdder_1_io_y; // @[Adder.scala 112:30]
  assign Adder_1_io_a = PipeAdder_2_io_y; // @[Adder.scala 111:30]
  assign Adder_1_io_b = PipeAdder_3_io_y; // @[Adder.scala 112:30]
  assign Adder_2_io_a = PipeAdder_4_io_y; // @[Adder.scala 111:30]
  assign Adder_2_io_b = PipeAdder_5_io_y; // @[Adder.scala 112:30]
  assign Adder_3_io_a = PipeAdder_6_io_y; // @[Adder.scala 111:30]
  assign Adder_3_io_b = PipeAdder_7_io_y; // @[Adder.scala 112:30]
  assign Adder_4_io_a = PipeAdder_8_io_y; // @[Adder.scala 111:30]
  assign Adder_4_io_b = PipeAdder_9_io_y; // @[Adder.scala 112:30]
  assign Adder_5_io_a = PipeAdder_10_io_y; // @[Adder.scala 111:30]
  assign Adder_5_io_b = PipeAdder_11_io_y; // @[Adder.scala 112:30]
  assign Adder_6_io_a = PipeAdder_12_io_y; // @[Adder.scala 111:30]
  assign Adder_6_io_b = PipeAdder_13_io_y; // @[Adder.scala 112:30]
  assign Adder_7_io_a = PipeAdder_14_io_y; // @[Adder.scala 111:30]
  assign Adder_7_io_b = PipeAdder_15_io_y; // @[Adder.scala 112:30]
  assign Adder_8_io_a = PipeAdder_16_io_y; // @[Adder.scala 111:30]
  assign Adder_8_io_b = PipeAdder_17_io_y; // @[Adder.scala 112:30]
  assign Adder_9_io_a = PipeAdder_18_io_y; // @[Adder.scala 111:30]
  assign Adder_9_io_b = PipeAdder_19_io_y; // @[Adder.scala 112:30]
  assign Adder_10_io_a = PipeAdder_20_io_y; // @[Adder.scala 111:30]
  assign Adder_10_io_b = PipeAdder_21_io_y; // @[Adder.scala 112:30]
  assign Adder_11_io_a = PipeAdder_22_io_y; // @[Adder.scala 111:30]
  assign Adder_11_io_b = PipeAdder_23_io_y; // @[Adder.scala 112:30]
  assign Adder_12_io_a = PipeAdder_24_io_y; // @[Adder.scala 111:30]
  assign Adder_12_io_b = PipeAdder_25_io_y; // @[Adder.scala 112:30]
  assign Adder_13_io_a = PipeAdder_26_io_y; // @[Adder.scala 111:30]
  assign Adder_13_io_b = PipeAdder_27_io_y; // @[Adder.scala 112:30]
  assign Adder_14_io_a = PipeAdder_28_io_y; // @[Adder.scala 111:30]
  assign Adder_14_io_b = PipeAdder_29_io_y; // @[Adder.scala 112:30]
  assign Adder_15_io_a = PipeAdder_30_io_y; // @[Adder.scala 111:30]
  assign Adder_15_io_b = PipeAdder_31_io_y; // @[Adder.scala 112:30]
  assign Adder_16_io_a = Adder_io_y; // @[Adder.scala 123:30]
  assign Adder_16_io_b = Adder_1_io_y; // @[Adder.scala 124:30]
  assign Adder_17_io_a = Adder_2_io_y; // @[Adder.scala 123:30]
  assign Adder_17_io_b = Adder_3_io_y; // @[Adder.scala 124:30]
  assign Adder_18_io_a = Adder_4_io_y; // @[Adder.scala 123:30]
  assign Adder_18_io_b = Adder_5_io_y; // @[Adder.scala 124:30]
  assign Adder_19_io_a = Adder_6_io_y; // @[Adder.scala 123:30]
  assign Adder_19_io_b = Adder_7_io_y; // @[Adder.scala 124:30]
  assign Adder_20_io_a = Adder_8_io_y; // @[Adder.scala 123:30]
  assign Adder_20_io_b = Adder_9_io_y; // @[Adder.scala 124:30]
  assign Adder_21_io_a = Adder_10_io_y; // @[Adder.scala 123:30]
  assign Adder_21_io_b = Adder_11_io_y; // @[Adder.scala 124:30]
  assign Adder_22_io_a = Adder_12_io_y; // @[Adder.scala 123:30]
  assign Adder_22_io_b = Adder_13_io_y; // @[Adder.scala 124:30]
  assign Adder_23_io_a = Adder_14_io_y; // @[Adder.scala 123:30]
  assign Adder_23_io_b = Adder_15_io_y; // @[Adder.scala 124:30]
  assign Adder_24_io_a = Adder_16_io_y; // @[Adder.scala 123:30]
  assign Adder_24_io_b = Adder_17_io_y; // @[Adder.scala 124:30]
  assign Adder_25_io_a = Adder_18_io_y; // @[Adder.scala 123:30]
  assign Adder_25_io_b = Adder_19_io_y; // @[Adder.scala 124:30]
  assign Adder_26_io_a = Adder_20_io_y; // @[Adder.scala 123:30]
  assign Adder_26_io_b = Adder_21_io_y; // @[Adder.scala 124:30]
  assign Adder_27_io_a = Adder_22_io_y; // @[Adder.scala 123:30]
  assign Adder_27_io_b = Adder_23_io_y; // @[Adder.scala 124:30]
  assign Adder_28_io_a = Adder_24_io_y; // @[Adder.scala 123:30]
  assign Adder_28_io_b = Adder_25_io_y; // @[Adder.scala 124:30]
  assign Adder_29_io_a = Adder_26_io_y; // @[Adder.scala 123:30]
  assign Adder_29_io_b = Adder_27_io_y; // @[Adder.scala 124:30]
  assign Adder_30_io_a = Adder_28_io_y; // @[Adder.scala 123:30]
  assign Adder_30_io_b = Adder_29_io_y; // @[Adder.scala 124:30]
endmodule
module DotProduct(
  input          clock,
  input  [31:0]  io_b_0,
  input  [31:0]  io_b_1,
  input  [31:0]  io_b_2,
  input  [31:0]  io_b_3,
  input  [31:0]  io_b_4,
  input  [31:0]  io_b_5,
  input  [31:0]  io_b_6,
  input  [31:0]  io_b_7,
  input  [31:0]  io_b_8,
  input  [31:0]  io_b_9,
  input  [31:0]  io_b_10,
  input  [31:0]  io_b_11,
  input  [31:0]  io_b_12,
  input  [31:0]  io_b_13,
  input  [31:0]  io_b_14,
  input  [31:0]  io_b_15,
  input  [31:0]  io_b_16,
  input  [31:0]  io_b_17,
  input  [31:0]  io_b_18,
  input  [31:0]  io_b_19,
  input  [31:0]  io_b_20,
  input  [31:0]  io_b_21,
  input  [31:0]  io_b_22,
  input  [31:0]  io_b_23,
  input  [31:0]  io_b_24,
  input  [31:0]  io_b_25,
  input  [31:0]  io_b_26,
  input  [31:0]  io_b_27,
  input  [31:0]  io_b_28,
  input  [31:0]  io_b_29,
  input  [31:0]  io_b_30,
  input  [31:0]  io_b_31,
  input  [31:0]  io_b_32,
  input  [31:0]  io_b_33,
  input  [31:0]  io_b_34,
  input  [31:0]  io_b_35,
  input  [31:0]  io_b_36,
  input  [31:0]  io_b_37,
  input  [31:0]  io_b_38,
  input  [31:0]  io_b_39,
  input  [31:0]  io_b_40,
  input  [31:0]  io_b_41,
  input  [31:0]  io_b_42,
  input  [31:0]  io_b_43,
  input  [31:0]  io_b_44,
  input  [31:0]  io_b_45,
  input  [31:0]  io_b_46,
  input  [31:0]  io_b_47,
  input  [31:0]  io_b_48,
  input  [31:0]  io_b_49,
  input  [31:0]  io_b_50,
  input  [31:0]  io_b_51,
  input  [31:0]  io_b_52,
  input  [31:0]  io_b_53,
  input  [31:0]  io_b_54,
  input  [31:0]  io_b_55,
  input  [31:0]  io_b_56,
  input  [31:0]  io_b_57,
  input  [31:0]  io_b_58,
  input  [31:0]  io_b_59,
  input  [31:0]  io_b_60,
  input  [31:0]  io_b_61,
  input  [31:0]  io_b_62,
  input  [31:0]  io_b_63,
  output [136:0] io_y
);
  wire  macs_0_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_0_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_0_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_0_io_y; // @[Matrix.scala 13:35]
  wire  macs_1_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_1_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_1_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_1_io_y; // @[Matrix.scala 13:35]
  wire  macs_2_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_2_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_2_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_2_io_y; // @[Matrix.scala 13:35]
  wire  macs_3_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_3_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_3_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_3_io_y; // @[Matrix.scala 13:35]
  wire  macs_4_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_4_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_4_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_4_io_y; // @[Matrix.scala 13:35]
  wire  macs_5_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_5_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_5_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_5_io_y; // @[Matrix.scala 13:35]
  wire  macs_6_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_6_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_6_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_6_io_y; // @[Matrix.scala 13:35]
  wire  macs_7_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_7_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_7_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_7_io_y; // @[Matrix.scala 13:35]
  wire  macs_8_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_8_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_8_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_8_io_y; // @[Matrix.scala 13:35]
  wire  macs_9_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_9_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_9_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_9_io_y; // @[Matrix.scala 13:35]
  wire  macs_10_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_10_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_10_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_10_io_y; // @[Matrix.scala 13:35]
  wire  macs_11_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_11_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_11_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_11_io_y; // @[Matrix.scala 13:35]
  wire  macs_12_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_12_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_12_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_12_io_y; // @[Matrix.scala 13:35]
  wire  macs_13_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_13_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_13_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_13_io_y; // @[Matrix.scala 13:35]
  wire  macs_14_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_14_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_14_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_14_io_y; // @[Matrix.scala 13:35]
  wire  macs_15_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_15_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_15_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_15_io_y; // @[Matrix.scala 13:35]
  wire  macs_16_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_16_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_16_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_16_io_y; // @[Matrix.scala 13:35]
  wire  macs_17_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_17_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_17_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_17_io_y; // @[Matrix.scala 13:35]
  wire  macs_18_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_18_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_18_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_18_io_y; // @[Matrix.scala 13:35]
  wire  macs_19_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_19_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_19_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_19_io_y; // @[Matrix.scala 13:35]
  wire  macs_20_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_20_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_20_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_20_io_y; // @[Matrix.scala 13:35]
  wire  macs_21_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_21_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_21_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_21_io_y; // @[Matrix.scala 13:35]
  wire  macs_22_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_22_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_22_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_22_io_y; // @[Matrix.scala 13:35]
  wire  macs_23_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_23_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_23_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_23_io_y; // @[Matrix.scala 13:35]
  wire  macs_24_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_24_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_24_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_24_io_y; // @[Matrix.scala 13:35]
  wire  macs_25_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_25_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_25_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_25_io_y; // @[Matrix.scala 13:35]
  wire  macs_26_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_26_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_26_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_26_io_y; // @[Matrix.scala 13:35]
  wire  macs_27_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_27_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_27_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_27_io_y; // @[Matrix.scala 13:35]
  wire  macs_28_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_28_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_28_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_28_io_y; // @[Matrix.scala 13:35]
  wire  macs_29_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_29_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_29_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_29_io_y; // @[Matrix.scala 13:35]
  wire  macs_30_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_30_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_30_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_30_io_y; // @[Matrix.scala 13:35]
  wire  macs_31_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_31_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_31_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_31_io_y; // @[Matrix.scala 13:35]
  wire  macs_32_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_32_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_32_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_32_io_y; // @[Matrix.scala 13:35]
  wire  macs_33_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_33_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_33_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_33_io_y; // @[Matrix.scala 13:35]
  wire  macs_34_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_34_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_34_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_34_io_y; // @[Matrix.scala 13:35]
  wire  macs_35_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_35_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_35_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_35_io_y; // @[Matrix.scala 13:35]
  wire  macs_36_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_36_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_36_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_36_io_y; // @[Matrix.scala 13:35]
  wire  macs_37_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_37_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_37_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_37_io_y; // @[Matrix.scala 13:35]
  wire  macs_38_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_38_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_38_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_38_io_y; // @[Matrix.scala 13:35]
  wire  macs_39_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_39_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_39_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_39_io_y; // @[Matrix.scala 13:35]
  wire  macs_40_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_40_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_40_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_40_io_y; // @[Matrix.scala 13:35]
  wire  macs_41_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_41_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_41_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_41_io_y; // @[Matrix.scala 13:35]
  wire  macs_42_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_42_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_42_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_42_io_y; // @[Matrix.scala 13:35]
  wire  macs_43_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_43_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_43_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_43_io_y; // @[Matrix.scala 13:35]
  wire  macs_44_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_44_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_44_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_44_io_y; // @[Matrix.scala 13:35]
  wire  macs_45_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_45_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_45_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_45_io_y; // @[Matrix.scala 13:35]
  wire  macs_46_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_46_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_46_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_46_io_y; // @[Matrix.scala 13:35]
  wire  macs_47_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_47_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_47_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_47_io_y; // @[Matrix.scala 13:35]
  wire  macs_48_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_48_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_48_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_48_io_y; // @[Matrix.scala 13:35]
  wire  macs_49_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_49_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_49_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_49_io_y; // @[Matrix.scala 13:35]
  wire  macs_50_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_50_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_50_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_50_io_y; // @[Matrix.scala 13:35]
  wire  macs_51_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_51_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_51_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_51_io_y; // @[Matrix.scala 13:35]
  wire  macs_52_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_52_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_52_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_52_io_y; // @[Matrix.scala 13:35]
  wire  macs_53_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_53_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_53_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_53_io_y; // @[Matrix.scala 13:35]
  wire  macs_54_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_54_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_54_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_54_io_y; // @[Matrix.scala 13:35]
  wire  macs_55_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_55_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_55_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_55_io_y; // @[Matrix.scala 13:35]
  wire  macs_56_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_56_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_56_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_56_io_y; // @[Matrix.scala 13:35]
  wire  macs_57_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_57_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_57_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_57_io_y; // @[Matrix.scala 13:35]
  wire  macs_58_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_58_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_58_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_58_io_y; // @[Matrix.scala 13:35]
  wire  macs_59_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_59_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_59_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_59_io_y; // @[Matrix.scala 13:35]
  wire  macs_60_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_60_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_60_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_60_io_y; // @[Matrix.scala 13:35]
  wire  macs_61_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_61_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_61_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_61_io_y; // @[Matrix.scala 13:35]
  wire  macs_62_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_62_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_62_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_62_io_y; // @[Matrix.scala 13:35]
  wire  macs_63_clock; // @[Matrix.scala 13:35]
  wire [31:0] macs_63_io_a; // @[Matrix.scala 13:35]
  wire [31:0] macs_63_io_b; // @[Matrix.scala 13:35]
  wire [64:0] macs_63_io_y; // @[Matrix.scala 13:35]
  wire  summer_clock; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_0; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_1; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_2; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_3; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_4; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_5; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_6; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_7; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_8; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_9; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_10; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_11; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_12; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_13; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_14; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_15; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_16; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_17; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_18; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_19; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_20; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_21; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_22; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_23; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_24; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_25; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_26; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_27; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_28; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_29; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_30; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_31; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_32; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_33; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_34; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_35; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_36; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_37; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_38; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_39; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_40; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_41; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_42; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_43; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_44; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_45; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_46; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_47; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_48; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_49; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_50; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_51; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_52; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_53; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_54; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_55; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_56; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_57; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_58; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_59; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_60; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_61; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_62; // @[Matrix.scala 14:22]
  wire [64:0] summer_io_inVec_63; // @[Matrix.scala 14:22]
  wire [136:0] summer_io_y; // @[Matrix.scala 14:22]
  MAC macs_0 ( // @[Matrix.scala 13:35]
    .clock(macs_0_clock),
    .io_a(macs_0_io_a),
    .io_b(macs_0_io_b),
    .io_y(macs_0_io_y)
  );
  MAC macs_1 ( // @[Matrix.scala 13:35]
    .clock(macs_1_clock),
    .io_a(macs_1_io_a),
    .io_b(macs_1_io_b),
    .io_y(macs_1_io_y)
  );
  MAC macs_2 ( // @[Matrix.scala 13:35]
    .clock(macs_2_clock),
    .io_a(macs_2_io_a),
    .io_b(macs_2_io_b),
    .io_y(macs_2_io_y)
  );
  MAC macs_3 ( // @[Matrix.scala 13:35]
    .clock(macs_3_clock),
    .io_a(macs_3_io_a),
    .io_b(macs_3_io_b),
    .io_y(macs_3_io_y)
  );
  MAC macs_4 ( // @[Matrix.scala 13:35]
    .clock(macs_4_clock),
    .io_a(macs_4_io_a),
    .io_b(macs_4_io_b),
    .io_y(macs_4_io_y)
  );
  MAC macs_5 ( // @[Matrix.scala 13:35]
    .clock(macs_5_clock),
    .io_a(macs_5_io_a),
    .io_b(macs_5_io_b),
    .io_y(macs_5_io_y)
  );
  MAC macs_6 ( // @[Matrix.scala 13:35]
    .clock(macs_6_clock),
    .io_a(macs_6_io_a),
    .io_b(macs_6_io_b),
    .io_y(macs_6_io_y)
  );
  MAC macs_7 ( // @[Matrix.scala 13:35]
    .clock(macs_7_clock),
    .io_a(macs_7_io_a),
    .io_b(macs_7_io_b),
    .io_y(macs_7_io_y)
  );
  MAC macs_8 ( // @[Matrix.scala 13:35]
    .clock(macs_8_clock),
    .io_a(macs_8_io_a),
    .io_b(macs_8_io_b),
    .io_y(macs_8_io_y)
  );
  MAC macs_9 ( // @[Matrix.scala 13:35]
    .clock(macs_9_clock),
    .io_a(macs_9_io_a),
    .io_b(macs_9_io_b),
    .io_y(macs_9_io_y)
  );
  MAC macs_10 ( // @[Matrix.scala 13:35]
    .clock(macs_10_clock),
    .io_a(macs_10_io_a),
    .io_b(macs_10_io_b),
    .io_y(macs_10_io_y)
  );
  MAC macs_11 ( // @[Matrix.scala 13:35]
    .clock(macs_11_clock),
    .io_a(macs_11_io_a),
    .io_b(macs_11_io_b),
    .io_y(macs_11_io_y)
  );
  MAC macs_12 ( // @[Matrix.scala 13:35]
    .clock(macs_12_clock),
    .io_a(macs_12_io_a),
    .io_b(macs_12_io_b),
    .io_y(macs_12_io_y)
  );
  MAC macs_13 ( // @[Matrix.scala 13:35]
    .clock(macs_13_clock),
    .io_a(macs_13_io_a),
    .io_b(macs_13_io_b),
    .io_y(macs_13_io_y)
  );
  MAC macs_14 ( // @[Matrix.scala 13:35]
    .clock(macs_14_clock),
    .io_a(macs_14_io_a),
    .io_b(macs_14_io_b),
    .io_y(macs_14_io_y)
  );
  MAC macs_15 ( // @[Matrix.scala 13:35]
    .clock(macs_15_clock),
    .io_a(macs_15_io_a),
    .io_b(macs_15_io_b),
    .io_y(macs_15_io_y)
  );
  MAC macs_16 ( // @[Matrix.scala 13:35]
    .clock(macs_16_clock),
    .io_a(macs_16_io_a),
    .io_b(macs_16_io_b),
    .io_y(macs_16_io_y)
  );
  MAC macs_17 ( // @[Matrix.scala 13:35]
    .clock(macs_17_clock),
    .io_a(macs_17_io_a),
    .io_b(macs_17_io_b),
    .io_y(macs_17_io_y)
  );
  MAC macs_18 ( // @[Matrix.scala 13:35]
    .clock(macs_18_clock),
    .io_a(macs_18_io_a),
    .io_b(macs_18_io_b),
    .io_y(macs_18_io_y)
  );
  MAC macs_19 ( // @[Matrix.scala 13:35]
    .clock(macs_19_clock),
    .io_a(macs_19_io_a),
    .io_b(macs_19_io_b),
    .io_y(macs_19_io_y)
  );
  MAC macs_20 ( // @[Matrix.scala 13:35]
    .clock(macs_20_clock),
    .io_a(macs_20_io_a),
    .io_b(macs_20_io_b),
    .io_y(macs_20_io_y)
  );
  MAC macs_21 ( // @[Matrix.scala 13:35]
    .clock(macs_21_clock),
    .io_a(macs_21_io_a),
    .io_b(macs_21_io_b),
    .io_y(macs_21_io_y)
  );
  MAC macs_22 ( // @[Matrix.scala 13:35]
    .clock(macs_22_clock),
    .io_a(macs_22_io_a),
    .io_b(macs_22_io_b),
    .io_y(macs_22_io_y)
  );
  MAC macs_23 ( // @[Matrix.scala 13:35]
    .clock(macs_23_clock),
    .io_a(macs_23_io_a),
    .io_b(macs_23_io_b),
    .io_y(macs_23_io_y)
  );
  MAC macs_24 ( // @[Matrix.scala 13:35]
    .clock(macs_24_clock),
    .io_a(macs_24_io_a),
    .io_b(macs_24_io_b),
    .io_y(macs_24_io_y)
  );
  MAC macs_25 ( // @[Matrix.scala 13:35]
    .clock(macs_25_clock),
    .io_a(macs_25_io_a),
    .io_b(macs_25_io_b),
    .io_y(macs_25_io_y)
  );
  MAC macs_26 ( // @[Matrix.scala 13:35]
    .clock(macs_26_clock),
    .io_a(macs_26_io_a),
    .io_b(macs_26_io_b),
    .io_y(macs_26_io_y)
  );
  MAC macs_27 ( // @[Matrix.scala 13:35]
    .clock(macs_27_clock),
    .io_a(macs_27_io_a),
    .io_b(macs_27_io_b),
    .io_y(macs_27_io_y)
  );
  MAC macs_28 ( // @[Matrix.scala 13:35]
    .clock(macs_28_clock),
    .io_a(macs_28_io_a),
    .io_b(macs_28_io_b),
    .io_y(macs_28_io_y)
  );
  MAC macs_29 ( // @[Matrix.scala 13:35]
    .clock(macs_29_clock),
    .io_a(macs_29_io_a),
    .io_b(macs_29_io_b),
    .io_y(macs_29_io_y)
  );
  MAC macs_30 ( // @[Matrix.scala 13:35]
    .clock(macs_30_clock),
    .io_a(macs_30_io_a),
    .io_b(macs_30_io_b),
    .io_y(macs_30_io_y)
  );
  MAC macs_31 ( // @[Matrix.scala 13:35]
    .clock(macs_31_clock),
    .io_a(macs_31_io_a),
    .io_b(macs_31_io_b),
    .io_y(macs_31_io_y)
  );
  MAC macs_32 ( // @[Matrix.scala 13:35]
    .clock(macs_32_clock),
    .io_a(macs_32_io_a),
    .io_b(macs_32_io_b),
    .io_y(macs_32_io_y)
  );
  MAC macs_33 ( // @[Matrix.scala 13:35]
    .clock(macs_33_clock),
    .io_a(macs_33_io_a),
    .io_b(macs_33_io_b),
    .io_y(macs_33_io_y)
  );
  MAC macs_34 ( // @[Matrix.scala 13:35]
    .clock(macs_34_clock),
    .io_a(macs_34_io_a),
    .io_b(macs_34_io_b),
    .io_y(macs_34_io_y)
  );
  MAC macs_35 ( // @[Matrix.scala 13:35]
    .clock(macs_35_clock),
    .io_a(macs_35_io_a),
    .io_b(macs_35_io_b),
    .io_y(macs_35_io_y)
  );
  MAC macs_36 ( // @[Matrix.scala 13:35]
    .clock(macs_36_clock),
    .io_a(macs_36_io_a),
    .io_b(macs_36_io_b),
    .io_y(macs_36_io_y)
  );
  MAC macs_37 ( // @[Matrix.scala 13:35]
    .clock(macs_37_clock),
    .io_a(macs_37_io_a),
    .io_b(macs_37_io_b),
    .io_y(macs_37_io_y)
  );
  MAC macs_38 ( // @[Matrix.scala 13:35]
    .clock(macs_38_clock),
    .io_a(macs_38_io_a),
    .io_b(macs_38_io_b),
    .io_y(macs_38_io_y)
  );
  MAC macs_39 ( // @[Matrix.scala 13:35]
    .clock(macs_39_clock),
    .io_a(macs_39_io_a),
    .io_b(macs_39_io_b),
    .io_y(macs_39_io_y)
  );
  MAC macs_40 ( // @[Matrix.scala 13:35]
    .clock(macs_40_clock),
    .io_a(macs_40_io_a),
    .io_b(macs_40_io_b),
    .io_y(macs_40_io_y)
  );
  MAC macs_41 ( // @[Matrix.scala 13:35]
    .clock(macs_41_clock),
    .io_a(macs_41_io_a),
    .io_b(macs_41_io_b),
    .io_y(macs_41_io_y)
  );
  MAC macs_42 ( // @[Matrix.scala 13:35]
    .clock(macs_42_clock),
    .io_a(macs_42_io_a),
    .io_b(macs_42_io_b),
    .io_y(macs_42_io_y)
  );
  MAC macs_43 ( // @[Matrix.scala 13:35]
    .clock(macs_43_clock),
    .io_a(macs_43_io_a),
    .io_b(macs_43_io_b),
    .io_y(macs_43_io_y)
  );
  MAC macs_44 ( // @[Matrix.scala 13:35]
    .clock(macs_44_clock),
    .io_a(macs_44_io_a),
    .io_b(macs_44_io_b),
    .io_y(macs_44_io_y)
  );
  MAC macs_45 ( // @[Matrix.scala 13:35]
    .clock(macs_45_clock),
    .io_a(macs_45_io_a),
    .io_b(macs_45_io_b),
    .io_y(macs_45_io_y)
  );
  MAC macs_46 ( // @[Matrix.scala 13:35]
    .clock(macs_46_clock),
    .io_a(macs_46_io_a),
    .io_b(macs_46_io_b),
    .io_y(macs_46_io_y)
  );
  MAC macs_47 ( // @[Matrix.scala 13:35]
    .clock(macs_47_clock),
    .io_a(macs_47_io_a),
    .io_b(macs_47_io_b),
    .io_y(macs_47_io_y)
  );
  MAC macs_48 ( // @[Matrix.scala 13:35]
    .clock(macs_48_clock),
    .io_a(macs_48_io_a),
    .io_b(macs_48_io_b),
    .io_y(macs_48_io_y)
  );
  MAC macs_49 ( // @[Matrix.scala 13:35]
    .clock(macs_49_clock),
    .io_a(macs_49_io_a),
    .io_b(macs_49_io_b),
    .io_y(macs_49_io_y)
  );
  MAC macs_50 ( // @[Matrix.scala 13:35]
    .clock(macs_50_clock),
    .io_a(macs_50_io_a),
    .io_b(macs_50_io_b),
    .io_y(macs_50_io_y)
  );
  MAC macs_51 ( // @[Matrix.scala 13:35]
    .clock(macs_51_clock),
    .io_a(macs_51_io_a),
    .io_b(macs_51_io_b),
    .io_y(macs_51_io_y)
  );
  MAC macs_52 ( // @[Matrix.scala 13:35]
    .clock(macs_52_clock),
    .io_a(macs_52_io_a),
    .io_b(macs_52_io_b),
    .io_y(macs_52_io_y)
  );
  MAC macs_53 ( // @[Matrix.scala 13:35]
    .clock(macs_53_clock),
    .io_a(macs_53_io_a),
    .io_b(macs_53_io_b),
    .io_y(macs_53_io_y)
  );
  MAC macs_54 ( // @[Matrix.scala 13:35]
    .clock(macs_54_clock),
    .io_a(macs_54_io_a),
    .io_b(macs_54_io_b),
    .io_y(macs_54_io_y)
  );
  MAC macs_55 ( // @[Matrix.scala 13:35]
    .clock(macs_55_clock),
    .io_a(macs_55_io_a),
    .io_b(macs_55_io_b),
    .io_y(macs_55_io_y)
  );
  MAC macs_56 ( // @[Matrix.scala 13:35]
    .clock(macs_56_clock),
    .io_a(macs_56_io_a),
    .io_b(macs_56_io_b),
    .io_y(macs_56_io_y)
  );
  MAC macs_57 ( // @[Matrix.scala 13:35]
    .clock(macs_57_clock),
    .io_a(macs_57_io_a),
    .io_b(macs_57_io_b),
    .io_y(macs_57_io_y)
  );
  MAC macs_58 ( // @[Matrix.scala 13:35]
    .clock(macs_58_clock),
    .io_a(macs_58_io_a),
    .io_b(macs_58_io_b),
    .io_y(macs_58_io_y)
  );
  MAC macs_59 ( // @[Matrix.scala 13:35]
    .clock(macs_59_clock),
    .io_a(macs_59_io_a),
    .io_b(macs_59_io_b),
    .io_y(macs_59_io_y)
  );
  MAC macs_60 ( // @[Matrix.scala 13:35]
    .clock(macs_60_clock),
    .io_a(macs_60_io_a),
    .io_b(macs_60_io_b),
    .io_y(macs_60_io_y)
  );
  MAC macs_61 ( // @[Matrix.scala 13:35]
    .clock(macs_61_clock),
    .io_a(macs_61_io_a),
    .io_b(macs_61_io_b),
    .io_y(macs_61_io_y)
  );
  MAC macs_62 ( // @[Matrix.scala 13:35]
    .clock(macs_62_clock),
    .io_a(macs_62_io_a),
    .io_b(macs_62_io_b),
    .io_y(macs_62_io_y)
  );
  MAC macs_63 ( // @[Matrix.scala 13:35]
    .clock(macs_63_clock),
    .io_a(macs_63_io_a),
    .io_b(macs_63_io_b),
    .io_y(macs_63_io_y)
  );
  LogSum summer ( // @[Matrix.scala 14:22]
    .clock(summer_clock),
    .io_inVec_0(summer_io_inVec_0),
    .io_inVec_1(summer_io_inVec_1),
    .io_inVec_2(summer_io_inVec_2),
    .io_inVec_3(summer_io_inVec_3),
    .io_inVec_4(summer_io_inVec_4),
    .io_inVec_5(summer_io_inVec_5),
    .io_inVec_6(summer_io_inVec_6),
    .io_inVec_7(summer_io_inVec_7),
    .io_inVec_8(summer_io_inVec_8),
    .io_inVec_9(summer_io_inVec_9),
    .io_inVec_10(summer_io_inVec_10),
    .io_inVec_11(summer_io_inVec_11),
    .io_inVec_12(summer_io_inVec_12),
    .io_inVec_13(summer_io_inVec_13),
    .io_inVec_14(summer_io_inVec_14),
    .io_inVec_15(summer_io_inVec_15),
    .io_inVec_16(summer_io_inVec_16),
    .io_inVec_17(summer_io_inVec_17),
    .io_inVec_18(summer_io_inVec_18),
    .io_inVec_19(summer_io_inVec_19),
    .io_inVec_20(summer_io_inVec_20),
    .io_inVec_21(summer_io_inVec_21),
    .io_inVec_22(summer_io_inVec_22),
    .io_inVec_23(summer_io_inVec_23),
    .io_inVec_24(summer_io_inVec_24),
    .io_inVec_25(summer_io_inVec_25),
    .io_inVec_26(summer_io_inVec_26),
    .io_inVec_27(summer_io_inVec_27),
    .io_inVec_28(summer_io_inVec_28),
    .io_inVec_29(summer_io_inVec_29),
    .io_inVec_30(summer_io_inVec_30),
    .io_inVec_31(summer_io_inVec_31),
    .io_inVec_32(summer_io_inVec_32),
    .io_inVec_33(summer_io_inVec_33),
    .io_inVec_34(summer_io_inVec_34),
    .io_inVec_35(summer_io_inVec_35),
    .io_inVec_36(summer_io_inVec_36),
    .io_inVec_37(summer_io_inVec_37),
    .io_inVec_38(summer_io_inVec_38),
    .io_inVec_39(summer_io_inVec_39),
    .io_inVec_40(summer_io_inVec_40),
    .io_inVec_41(summer_io_inVec_41),
    .io_inVec_42(summer_io_inVec_42),
    .io_inVec_43(summer_io_inVec_43),
    .io_inVec_44(summer_io_inVec_44),
    .io_inVec_45(summer_io_inVec_45),
    .io_inVec_46(summer_io_inVec_46),
    .io_inVec_47(summer_io_inVec_47),
    .io_inVec_48(summer_io_inVec_48),
    .io_inVec_49(summer_io_inVec_49),
    .io_inVec_50(summer_io_inVec_50),
    .io_inVec_51(summer_io_inVec_51),
    .io_inVec_52(summer_io_inVec_52),
    .io_inVec_53(summer_io_inVec_53),
    .io_inVec_54(summer_io_inVec_54),
    .io_inVec_55(summer_io_inVec_55),
    .io_inVec_56(summer_io_inVec_56),
    .io_inVec_57(summer_io_inVec_57),
    .io_inVec_58(summer_io_inVec_58),
    .io_inVec_59(summer_io_inVec_59),
    .io_inVec_60(summer_io_inVec_60),
    .io_inVec_61(summer_io_inVec_61),
    .io_inVec_62(summer_io_inVec_62),
    .io_inVec_63(summer_io_inVec_63),
    .io_y(summer_io_y)
  );
  assign io_y = summer_io_y; // @[Matrix.scala 29:8]
  assign macs_0_clock = clock;
  assign macs_0_io_a = 32'h0; // @[Matrix.scala 23:18]
  assign macs_0_io_b = io_b_0; // @[Matrix.scala 24:18]
  assign macs_1_clock = clock;
  assign macs_1_io_a = 32'h8; // @[Matrix.scala 23:18]
  assign macs_1_io_b = io_b_1; // @[Matrix.scala 24:18]
  assign macs_2_clock = clock;
  assign macs_2_io_a = 32'h10; // @[Matrix.scala 23:18]
  assign macs_2_io_b = io_b_2; // @[Matrix.scala 24:18]
  assign macs_3_clock = clock;
  assign macs_3_io_a = 32'h18; // @[Matrix.scala 23:18]
  assign macs_3_io_b = io_b_3; // @[Matrix.scala 24:18]
  assign macs_4_clock = clock;
  assign macs_4_io_a = 32'h20; // @[Matrix.scala 23:18]
  assign macs_4_io_b = io_b_4; // @[Matrix.scala 24:18]
  assign macs_5_clock = clock;
  assign macs_5_io_a = 32'h28; // @[Matrix.scala 23:18]
  assign macs_5_io_b = io_b_5; // @[Matrix.scala 24:18]
  assign macs_6_clock = clock;
  assign macs_6_io_a = 32'h30; // @[Matrix.scala 23:18]
  assign macs_6_io_b = io_b_6; // @[Matrix.scala 24:18]
  assign macs_7_clock = clock;
  assign macs_7_io_a = 32'h38; // @[Matrix.scala 23:18]
  assign macs_7_io_b = io_b_7; // @[Matrix.scala 24:18]
  assign macs_8_clock = clock;
  assign macs_8_io_a = 32'h1; // @[Matrix.scala 23:18]
  assign macs_8_io_b = io_b_8; // @[Matrix.scala 24:18]
  assign macs_9_clock = clock;
  assign macs_9_io_a = 32'h9; // @[Matrix.scala 23:18]
  assign macs_9_io_b = io_b_9; // @[Matrix.scala 24:18]
  assign macs_10_clock = clock;
  assign macs_10_io_a = 32'h11; // @[Matrix.scala 23:18]
  assign macs_10_io_b = io_b_10; // @[Matrix.scala 24:18]
  assign macs_11_clock = clock;
  assign macs_11_io_a = 32'h19; // @[Matrix.scala 23:18]
  assign macs_11_io_b = io_b_11; // @[Matrix.scala 24:18]
  assign macs_12_clock = clock;
  assign macs_12_io_a = 32'h21; // @[Matrix.scala 23:18]
  assign macs_12_io_b = io_b_12; // @[Matrix.scala 24:18]
  assign macs_13_clock = clock;
  assign macs_13_io_a = 32'h29; // @[Matrix.scala 23:18]
  assign macs_13_io_b = io_b_13; // @[Matrix.scala 24:18]
  assign macs_14_clock = clock;
  assign macs_14_io_a = 32'h31; // @[Matrix.scala 23:18]
  assign macs_14_io_b = io_b_14; // @[Matrix.scala 24:18]
  assign macs_15_clock = clock;
  assign macs_15_io_a = 32'h39; // @[Matrix.scala 23:18]
  assign macs_15_io_b = io_b_15; // @[Matrix.scala 24:18]
  assign macs_16_clock = clock;
  assign macs_16_io_a = 32'h2; // @[Matrix.scala 23:18]
  assign macs_16_io_b = io_b_16; // @[Matrix.scala 24:18]
  assign macs_17_clock = clock;
  assign macs_17_io_a = 32'ha; // @[Matrix.scala 23:18]
  assign macs_17_io_b = io_b_17; // @[Matrix.scala 24:18]
  assign macs_18_clock = clock;
  assign macs_18_io_a = 32'h12; // @[Matrix.scala 23:18]
  assign macs_18_io_b = io_b_18; // @[Matrix.scala 24:18]
  assign macs_19_clock = clock;
  assign macs_19_io_a = 32'h1a; // @[Matrix.scala 23:18]
  assign macs_19_io_b = io_b_19; // @[Matrix.scala 24:18]
  assign macs_20_clock = clock;
  assign macs_20_io_a = 32'h22; // @[Matrix.scala 23:18]
  assign macs_20_io_b = io_b_20; // @[Matrix.scala 24:18]
  assign macs_21_clock = clock;
  assign macs_21_io_a = 32'h2a; // @[Matrix.scala 23:18]
  assign macs_21_io_b = io_b_21; // @[Matrix.scala 24:18]
  assign macs_22_clock = clock;
  assign macs_22_io_a = 32'h32; // @[Matrix.scala 23:18]
  assign macs_22_io_b = io_b_22; // @[Matrix.scala 24:18]
  assign macs_23_clock = clock;
  assign macs_23_io_a = 32'h3a; // @[Matrix.scala 23:18]
  assign macs_23_io_b = io_b_23; // @[Matrix.scala 24:18]
  assign macs_24_clock = clock;
  assign macs_24_io_a = 32'h3; // @[Matrix.scala 23:18]
  assign macs_24_io_b = io_b_24; // @[Matrix.scala 24:18]
  assign macs_25_clock = clock;
  assign macs_25_io_a = 32'hb; // @[Matrix.scala 23:18]
  assign macs_25_io_b = io_b_25; // @[Matrix.scala 24:18]
  assign macs_26_clock = clock;
  assign macs_26_io_a = 32'h13; // @[Matrix.scala 23:18]
  assign macs_26_io_b = io_b_26; // @[Matrix.scala 24:18]
  assign macs_27_clock = clock;
  assign macs_27_io_a = 32'h1b; // @[Matrix.scala 23:18]
  assign macs_27_io_b = io_b_27; // @[Matrix.scala 24:18]
  assign macs_28_clock = clock;
  assign macs_28_io_a = 32'h23; // @[Matrix.scala 23:18]
  assign macs_28_io_b = io_b_28; // @[Matrix.scala 24:18]
  assign macs_29_clock = clock;
  assign macs_29_io_a = 32'h2b; // @[Matrix.scala 23:18]
  assign macs_29_io_b = io_b_29; // @[Matrix.scala 24:18]
  assign macs_30_clock = clock;
  assign macs_30_io_a = 32'h33; // @[Matrix.scala 23:18]
  assign macs_30_io_b = io_b_30; // @[Matrix.scala 24:18]
  assign macs_31_clock = clock;
  assign macs_31_io_a = 32'h3b; // @[Matrix.scala 23:18]
  assign macs_31_io_b = io_b_31; // @[Matrix.scala 24:18]
  assign macs_32_clock = clock;
  assign macs_32_io_a = 32'h4; // @[Matrix.scala 23:18]
  assign macs_32_io_b = io_b_32; // @[Matrix.scala 24:18]
  assign macs_33_clock = clock;
  assign macs_33_io_a = 32'hc; // @[Matrix.scala 23:18]
  assign macs_33_io_b = io_b_33; // @[Matrix.scala 24:18]
  assign macs_34_clock = clock;
  assign macs_34_io_a = 32'h14; // @[Matrix.scala 23:18]
  assign macs_34_io_b = io_b_34; // @[Matrix.scala 24:18]
  assign macs_35_clock = clock;
  assign macs_35_io_a = 32'h1c; // @[Matrix.scala 23:18]
  assign macs_35_io_b = io_b_35; // @[Matrix.scala 24:18]
  assign macs_36_clock = clock;
  assign macs_36_io_a = 32'h24; // @[Matrix.scala 23:18]
  assign macs_36_io_b = io_b_36; // @[Matrix.scala 24:18]
  assign macs_37_clock = clock;
  assign macs_37_io_a = 32'h2c; // @[Matrix.scala 23:18]
  assign macs_37_io_b = io_b_37; // @[Matrix.scala 24:18]
  assign macs_38_clock = clock;
  assign macs_38_io_a = 32'h34; // @[Matrix.scala 23:18]
  assign macs_38_io_b = io_b_38; // @[Matrix.scala 24:18]
  assign macs_39_clock = clock;
  assign macs_39_io_a = 32'h3c; // @[Matrix.scala 23:18]
  assign macs_39_io_b = io_b_39; // @[Matrix.scala 24:18]
  assign macs_40_clock = clock;
  assign macs_40_io_a = 32'h5; // @[Matrix.scala 23:18]
  assign macs_40_io_b = io_b_40; // @[Matrix.scala 24:18]
  assign macs_41_clock = clock;
  assign macs_41_io_a = 32'hd; // @[Matrix.scala 23:18]
  assign macs_41_io_b = io_b_41; // @[Matrix.scala 24:18]
  assign macs_42_clock = clock;
  assign macs_42_io_a = 32'h15; // @[Matrix.scala 23:18]
  assign macs_42_io_b = io_b_42; // @[Matrix.scala 24:18]
  assign macs_43_clock = clock;
  assign macs_43_io_a = 32'h1d; // @[Matrix.scala 23:18]
  assign macs_43_io_b = io_b_43; // @[Matrix.scala 24:18]
  assign macs_44_clock = clock;
  assign macs_44_io_a = 32'h25; // @[Matrix.scala 23:18]
  assign macs_44_io_b = io_b_44; // @[Matrix.scala 24:18]
  assign macs_45_clock = clock;
  assign macs_45_io_a = 32'h2d; // @[Matrix.scala 23:18]
  assign macs_45_io_b = io_b_45; // @[Matrix.scala 24:18]
  assign macs_46_clock = clock;
  assign macs_46_io_a = 32'h35; // @[Matrix.scala 23:18]
  assign macs_46_io_b = io_b_46; // @[Matrix.scala 24:18]
  assign macs_47_clock = clock;
  assign macs_47_io_a = 32'h3d; // @[Matrix.scala 23:18]
  assign macs_47_io_b = io_b_47; // @[Matrix.scala 24:18]
  assign macs_48_clock = clock;
  assign macs_48_io_a = 32'h6; // @[Matrix.scala 23:18]
  assign macs_48_io_b = io_b_48; // @[Matrix.scala 24:18]
  assign macs_49_clock = clock;
  assign macs_49_io_a = 32'he; // @[Matrix.scala 23:18]
  assign macs_49_io_b = io_b_49; // @[Matrix.scala 24:18]
  assign macs_50_clock = clock;
  assign macs_50_io_a = 32'h16; // @[Matrix.scala 23:18]
  assign macs_50_io_b = io_b_50; // @[Matrix.scala 24:18]
  assign macs_51_clock = clock;
  assign macs_51_io_a = 32'h1e; // @[Matrix.scala 23:18]
  assign macs_51_io_b = io_b_51; // @[Matrix.scala 24:18]
  assign macs_52_clock = clock;
  assign macs_52_io_a = 32'h26; // @[Matrix.scala 23:18]
  assign macs_52_io_b = io_b_52; // @[Matrix.scala 24:18]
  assign macs_53_clock = clock;
  assign macs_53_io_a = 32'h2e; // @[Matrix.scala 23:18]
  assign macs_53_io_b = io_b_53; // @[Matrix.scala 24:18]
  assign macs_54_clock = clock;
  assign macs_54_io_a = 32'h36; // @[Matrix.scala 23:18]
  assign macs_54_io_b = io_b_54; // @[Matrix.scala 24:18]
  assign macs_55_clock = clock;
  assign macs_55_io_a = 32'h3e; // @[Matrix.scala 23:18]
  assign macs_55_io_b = io_b_55; // @[Matrix.scala 24:18]
  assign macs_56_clock = clock;
  assign macs_56_io_a = 32'h7; // @[Matrix.scala 23:18]
  assign macs_56_io_b = io_b_56; // @[Matrix.scala 24:18]
  assign macs_57_clock = clock;
  assign macs_57_io_a = 32'hf; // @[Matrix.scala 23:18]
  assign macs_57_io_b = io_b_57; // @[Matrix.scala 24:18]
  assign macs_58_clock = clock;
  assign macs_58_io_a = 32'h17; // @[Matrix.scala 23:18]
  assign macs_58_io_b = io_b_58; // @[Matrix.scala 24:18]
  assign macs_59_clock = clock;
  assign macs_59_io_a = 32'h1f; // @[Matrix.scala 23:18]
  assign macs_59_io_b = io_b_59; // @[Matrix.scala 24:18]
  assign macs_60_clock = clock;
  assign macs_60_io_a = 32'h27; // @[Matrix.scala 23:18]
  assign macs_60_io_b = io_b_60; // @[Matrix.scala 24:18]
  assign macs_61_clock = clock;
  assign macs_61_io_a = 32'h2f; // @[Matrix.scala 23:18]
  assign macs_61_io_b = io_b_61; // @[Matrix.scala 24:18]
  assign macs_62_clock = clock;
  assign macs_62_io_a = 32'h37; // @[Matrix.scala 23:18]
  assign macs_62_io_b = io_b_62; // @[Matrix.scala 24:18]
  assign macs_63_clock = clock;
  assign macs_63_io_a = 32'h3f; // @[Matrix.scala 23:18]
  assign macs_63_io_b = io_b_63; // @[Matrix.scala 24:18]
  assign summer_clock = clock;
  assign summer_io_inVec_0 = macs_0_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_1 = macs_1_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_2 = macs_2_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_3 = macs_3_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_4 = macs_4_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_5 = macs_5_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_6 = macs_6_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_7 = macs_7_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_8 = macs_8_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_9 = macs_9_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_10 = macs_10_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_11 = macs_11_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_12 = macs_12_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_13 = macs_13_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_14 = macs_14_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_15 = macs_15_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_16 = macs_16_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_17 = macs_17_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_18 = macs_18_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_19 = macs_19_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_20 = macs_20_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_21 = macs_21_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_22 = macs_22_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_23 = macs_23_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_24 = macs_24_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_25 = macs_25_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_26 = macs_26_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_27 = macs_27_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_28 = macs_28_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_29 = macs_29_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_30 = macs_30_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_31 = macs_31_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_32 = macs_32_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_33 = macs_33_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_34 = macs_34_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_35 = macs_35_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_36 = macs_36_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_37 = macs_37_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_38 = macs_38_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_39 = macs_39_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_40 = macs_40_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_41 = macs_41_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_42 = macs_42_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_43 = macs_43_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_44 = macs_44_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_45 = macs_45_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_46 = macs_46_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_47 = macs_47_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_48 = macs_48_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_49 = macs_49_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_50 = macs_50_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_51 = macs_51_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_52 = macs_52_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_53 = macs_53_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_54 = macs_54_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_55 = macs_55_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_56 = macs_56_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_57 = macs_57_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_58 = macs_58_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_59 = macs_59_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_60 = macs_60_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_61 = macs_61_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_62 = macs_62_io_y; // @[Matrix.scala 27:24]
  assign summer_io_inVec_63 = macs_63_io_y; // @[Matrix.scala 27:24]
endmodule
module Conv(
  input          clock,
  input          reset,
  input          io_inData_valid,
  input  [31:0]  io_inData_bits_0,
  input  [31:0]  io_inData_bits_1,
  input  [31:0]  io_inData_bits_2,
  input  [31:0]  io_inData_bits_3,
  input  [31:0]  io_inData_bits_4,
  input  [31:0]  io_inData_bits_5,
  input  [31:0]  io_inData_bits_6,
  input  [31:0]  io_inData_bits_7,
  input  [31:0]  io_inData_bits_8,
  input  [31:0]  io_inData_bits_9,
  output [136:0] io_outData
);
  wire  im2col_clock; // @[Conv.scala 12:22]
  wire  im2col_reset; // @[Conv.scala 12:22]
  wire  im2col_io_inData_valid; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_inData_bits_0; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_inData_bits_1; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_inData_bits_2; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_inData_bits_3; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_inData_bits_4; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_inData_bits_5; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_inData_bits_6; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_inData_bits_7; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_inData_bits_8; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_inData_bits_9; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_0; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_1; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_2; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_3; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_4; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_5; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_6; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_7; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_8; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_9; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_10; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_11; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_12; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_13; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_14; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_15; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_16; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_17; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_18; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_19; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_20; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_21; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_22; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_23; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_24; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_25; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_26; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_27; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_28; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_29; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_30; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_31; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_32; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_33; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_34; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_35; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_36; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_37; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_38; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_39; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_40; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_41; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_42; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_43; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_44; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_45; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_46; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_47; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_48; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_49; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_50; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_51; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_52; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_53; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_54; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_55; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_56; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_57; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_58; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_59; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_60; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_61; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_62; // @[Conv.scala 12:22]
  wire [31:0] im2col_io_outData_63; // @[Conv.scala 12:22]
  wire  kernelDot_clock; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_0; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_1; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_2; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_3; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_4; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_5; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_6; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_7; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_8; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_9; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_10; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_11; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_12; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_13; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_14; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_15; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_16; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_17; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_18; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_19; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_20; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_21; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_22; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_23; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_24; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_25; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_26; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_27; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_28; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_29; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_30; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_31; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_32; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_33; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_34; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_35; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_36; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_37; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_38; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_39; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_40; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_41; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_42; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_43; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_44; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_45; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_46; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_47; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_48; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_49; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_50; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_51; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_52; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_53; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_54; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_55; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_56; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_57; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_58; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_59; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_60; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_61; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_62; // @[Conv.scala 13:25]
  wire [31:0] kernelDot_io_b_63; // @[Conv.scala 13:25]
  wire [136:0] kernelDot_io_y; // @[Conv.scala 13:25]
  Im2ColMine im2col ( // @[Conv.scala 12:22]
    .clock(im2col_clock),
    .reset(im2col_reset),
    .io_inData_valid(im2col_io_inData_valid),
    .io_inData_bits_0(im2col_io_inData_bits_0),
    .io_inData_bits_1(im2col_io_inData_bits_1),
    .io_inData_bits_2(im2col_io_inData_bits_2),
    .io_inData_bits_3(im2col_io_inData_bits_3),
    .io_inData_bits_4(im2col_io_inData_bits_4),
    .io_inData_bits_5(im2col_io_inData_bits_5),
    .io_inData_bits_6(im2col_io_inData_bits_6),
    .io_inData_bits_7(im2col_io_inData_bits_7),
    .io_inData_bits_8(im2col_io_inData_bits_8),
    .io_inData_bits_9(im2col_io_inData_bits_9),
    .io_outData_0(im2col_io_outData_0),
    .io_outData_1(im2col_io_outData_1),
    .io_outData_2(im2col_io_outData_2),
    .io_outData_3(im2col_io_outData_3),
    .io_outData_4(im2col_io_outData_4),
    .io_outData_5(im2col_io_outData_5),
    .io_outData_6(im2col_io_outData_6),
    .io_outData_7(im2col_io_outData_7),
    .io_outData_8(im2col_io_outData_8),
    .io_outData_9(im2col_io_outData_9),
    .io_outData_10(im2col_io_outData_10),
    .io_outData_11(im2col_io_outData_11),
    .io_outData_12(im2col_io_outData_12),
    .io_outData_13(im2col_io_outData_13),
    .io_outData_14(im2col_io_outData_14),
    .io_outData_15(im2col_io_outData_15),
    .io_outData_16(im2col_io_outData_16),
    .io_outData_17(im2col_io_outData_17),
    .io_outData_18(im2col_io_outData_18),
    .io_outData_19(im2col_io_outData_19),
    .io_outData_20(im2col_io_outData_20),
    .io_outData_21(im2col_io_outData_21),
    .io_outData_22(im2col_io_outData_22),
    .io_outData_23(im2col_io_outData_23),
    .io_outData_24(im2col_io_outData_24),
    .io_outData_25(im2col_io_outData_25),
    .io_outData_26(im2col_io_outData_26),
    .io_outData_27(im2col_io_outData_27),
    .io_outData_28(im2col_io_outData_28),
    .io_outData_29(im2col_io_outData_29),
    .io_outData_30(im2col_io_outData_30),
    .io_outData_31(im2col_io_outData_31),
    .io_outData_32(im2col_io_outData_32),
    .io_outData_33(im2col_io_outData_33),
    .io_outData_34(im2col_io_outData_34),
    .io_outData_35(im2col_io_outData_35),
    .io_outData_36(im2col_io_outData_36),
    .io_outData_37(im2col_io_outData_37),
    .io_outData_38(im2col_io_outData_38),
    .io_outData_39(im2col_io_outData_39),
    .io_outData_40(im2col_io_outData_40),
    .io_outData_41(im2col_io_outData_41),
    .io_outData_42(im2col_io_outData_42),
    .io_outData_43(im2col_io_outData_43),
    .io_outData_44(im2col_io_outData_44),
    .io_outData_45(im2col_io_outData_45),
    .io_outData_46(im2col_io_outData_46),
    .io_outData_47(im2col_io_outData_47),
    .io_outData_48(im2col_io_outData_48),
    .io_outData_49(im2col_io_outData_49),
    .io_outData_50(im2col_io_outData_50),
    .io_outData_51(im2col_io_outData_51),
    .io_outData_52(im2col_io_outData_52),
    .io_outData_53(im2col_io_outData_53),
    .io_outData_54(im2col_io_outData_54),
    .io_outData_55(im2col_io_outData_55),
    .io_outData_56(im2col_io_outData_56),
    .io_outData_57(im2col_io_outData_57),
    .io_outData_58(im2col_io_outData_58),
    .io_outData_59(im2col_io_outData_59),
    .io_outData_60(im2col_io_outData_60),
    .io_outData_61(im2col_io_outData_61),
    .io_outData_62(im2col_io_outData_62),
    .io_outData_63(im2col_io_outData_63)
  );
  DotProduct kernelDot ( // @[Conv.scala 13:25]
    .clock(kernelDot_clock),
    .io_b_0(kernelDot_io_b_0),
    .io_b_1(kernelDot_io_b_1),
    .io_b_2(kernelDot_io_b_2),
    .io_b_3(kernelDot_io_b_3),
    .io_b_4(kernelDot_io_b_4),
    .io_b_5(kernelDot_io_b_5),
    .io_b_6(kernelDot_io_b_6),
    .io_b_7(kernelDot_io_b_7),
    .io_b_8(kernelDot_io_b_8),
    .io_b_9(kernelDot_io_b_9),
    .io_b_10(kernelDot_io_b_10),
    .io_b_11(kernelDot_io_b_11),
    .io_b_12(kernelDot_io_b_12),
    .io_b_13(kernelDot_io_b_13),
    .io_b_14(kernelDot_io_b_14),
    .io_b_15(kernelDot_io_b_15),
    .io_b_16(kernelDot_io_b_16),
    .io_b_17(kernelDot_io_b_17),
    .io_b_18(kernelDot_io_b_18),
    .io_b_19(kernelDot_io_b_19),
    .io_b_20(kernelDot_io_b_20),
    .io_b_21(kernelDot_io_b_21),
    .io_b_22(kernelDot_io_b_22),
    .io_b_23(kernelDot_io_b_23),
    .io_b_24(kernelDot_io_b_24),
    .io_b_25(kernelDot_io_b_25),
    .io_b_26(kernelDot_io_b_26),
    .io_b_27(kernelDot_io_b_27),
    .io_b_28(kernelDot_io_b_28),
    .io_b_29(kernelDot_io_b_29),
    .io_b_30(kernelDot_io_b_30),
    .io_b_31(kernelDot_io_b_31),
    .io_b_32(kernelDot_io_b_32),
    .io_b_33(kernelDot_io_b_33),
    .io_b_34(kernelDot_io_b_34),
    .io_b_35(kernelDot_io_b_35),
    .io_b_36(kernelDot_io_b_36),
    .io_b_37(kernelDot_io_b_37),
    .io_b_38(kernelDot_io_b_38),
    .io_b_39(kernelDot_io_b_39),
    .io_b_40(kernelDot_io_b_40),
    .io_b_41(kernelDot_io_b_41),
    .io_b_42(kernelDot_io_b_42),
    .io_b_43(kernelDot_io_b_43),
    .io_b_44(kernelDot_io_b_44),
    .io_b_45(kernelDot_io_b_45),
    .io_b_46(kernelDot_io_b_46),
    .io_b_47(kernelDot_io_b_47),
    .io_b_48(kernelDot_io_b_48),
    .io_b_49(kernelDot_io_b_49),
    .io_b_50(kernelDot_io_b_50),
    .io_b_51(kernelDot_io_b_51),
    .io_b_52(kernelDot_io_b_52),
    .io_b_53(kernelDot_io_b_53),
    .io_b_54(kernelDot_io_b_54),
    .io_b_55(kernelDot_io_b_55),
    .io_b_56(kernelDot_io_b_56),
    .io_b_57(kernelDot_io_b_57),
    .io_b_58(kernelDot_io_b_58),
    .io_b_59(kernelDot_io_b_59),
    .io_b_60(kernelDot_io_b_60),
    .io_b_61(kernelDot_io_b_61),
    .io_b_62(kernelDot_io_b_62),
    .io_b_63(kernelDot_io_b_63),
    .io_y(kernelDot_io_y)
  );
  assign io_outData = kernelDot_io_y; // @[Conv.scala 28:14]
  assign im2col_clock = clock;
  assign im2col_reset = reset;
  assign im2col_io_inData_valid = io_inData_valid; // @[Conv.scala 20:20]
  assign im2col_io_inData_bits_0 = io_inData_bits_0; // @[Conv.scala 20:20]
  assign im2col_io_inData_bits_1 = io_inData_bits_1; // @[Conv.scala 20:20]
  assign im2col_io_inData_bits_2 = io_inData_bits_2; // @[Conv.scala 20:20]
  assign im2col_io_inData_bits_3 = io_inData_bits_3; // @[Conv.scala 20:20]
  assign im2col_io_inData_bits_4 = io_inData_bits_4; // @[Conv.scala 20:20]
  assign im2col_io_inData_bits_5 = io_inData_bits_5; // @[Conv.scala 20:20]
  assign im2col_io_inData_bits_6 = io_inData_bits_6; // @[Conv.scala 20:20]
  assign im2col_io_inData_bits_7 = io_inData_bits_7; // @[Conv.scala 20:20]
  assign im2col_io_inData_bits_8 = io_inData_bits_8; // @[Conv.scala 20:20]
  assign im2col_io_inData_bits_9 = io_inData_bits_9; // @[Conv.scala 20:20]
  assign kernelDot_clock = clock;
  assign kernelDot_io_b_0 = im2col_io_outData_0; // @[Conv.scala 26:23]
  assign kernelDot_io_b_1 = im2col_io_outData_1; // @[Conv.scala 26:23]
  assign kernelDot_io_b_2 = im2col_io_outData_2; // @[Conv.scala 26:23]
  assign kernelDot_io_b_3 = im2col_io_outData_3; // @[Conv.scala 26:23]
  assign kernelDot_io_b_4 = im2col_io_outData_4; // @[Conv.scala 26:23]
  assign kernelDot_io_b_5 = im2col_io_outData_5; // @[Conv.scala 26:23]
  assign kernelDot_io_b_6 = im2col_io_outData_6; // @[Conv.scala 26:23]
  assign kernelDot_io_b_7 = im2col_io_outData_7; // @[Conv.scala 26:23]
  assign kernelDot_io_b_8 = im2col_io_outData_8; // @[Conv.scala 26:23]
  assign kernelDot_io_b_9 = im2col_io_outData_9; // @[Conv.scala 26:23]
  assign kernelDot_io_b_10 = im2col_io_outData_10; // @[Conv.scala 26:23]
  assign kernelDot_io_b_11 = im2col_io_outData_11; // @[Conv.scala 26:23]
  assign kernelDot_io_b_12 = im2col_io_outData_12; // @[Conv.scala 26:23]
  assign kernelDot_io_b_13 = im2col_io_outData_13; // @[Conv.scala 26:23]
  assign kernelDot_io_b_14 = im2col_io_outData_14; // @[Conv.scala 26:23]
  assign kernelDot_io_b_15 = im2col_io_outData_15; // @[Conv.scala 26:23]
  assign kernelDot_io_b_16 = im2col_io_outData_16; // @[Conv.scala 26:23]
  assign kernelDot_io_b_17 = im2col_io_outData_17; // @[Conv.scala 26:23]
  assign kernelDot_io_b_18 = im2col_io_outData_18; // @[Conv.scala 26:23]
  assign kernelDot_io_b_19 = im2col_io_outData_19; // @[Conv.scala 26:23]
  assign kernelDot_io_b_20 = im2col_io_outData_20; // @[Conv.scala 26:23]
  assign kernelDot_io_b_21 = im2col_io_outData_21; // @[Conv.scala 26:23]
  assign kernelDot_io_b_22 = im2col_io_outData_22; // @[Conv.scala 26:23]
  assign kernelDot_io_b_23 = im2col_io_outData_23; // @[Conv.scala 26:23]
  assign kernelDot_io_b_24 = im2col_io_outData_24; // @[Conv.scala 26:23]
  assign kernelDot_io_b_25 = im2col_io_outData_25; // @[Conv.scala 26:23]
  assign kernelDot_io_b_26 = im2col_io_outData_26; // @[Conv.scala 26:23]
  assign kernelDot_io_b_27 = im2col_io_outData_27; // @[Conv.scala 26:23]
  assign kernelDot_io_b_28 = im2col_io_outData_28; // @[Conv.scala 26:23]
  assign kernelDot_io_b_29 = im2col_io_outData_29; // @[Conv.scala 26:23]
  assign kernelDot_io_b_30 = im2col_io_outData_30; // @[Conv.scala 26:23]
  assign kernelDot_io_b_31 = im2col_io_outData_31; // @[Conv.scala 26:23]
  assign kernelDot_io_b_32 = im2col_io_outData_32; // @[Conv.scala 26:23]
  assign kernelDot_io_b_33 = im2col_io_outData_33; // @[Conv.scala 26:23]
  assign kernelDot_io_b_34 = im2col_io_outData_34; // @[Conv.scala 26:23]
  assign kernelDot_io_b_35 = im2col_io_outData_35; // @[Conv.scala 26:23]
  assign kernelDot_io_b_36 = im2col_io_outData_36; // @[Conv.scala 26:23]
  assign kernelDot_io_b_37 = im2col_io_outData_37; // @[Conv.scala 26:23]
  assign kernelDot_io_b_38 = im2col_io_outData_38; // @[Conv.scala 26:23]
  assign kernelDot_io_b_39 = im2col_io_outData_39; // @[Conv.scala 26:23]
  assign kernelDot_io_b_40 = im2col_io_outData_40; // @[Conv.scala 26:23]
  assign kernelDot_io_b_41 = im2col_io_outData_41; // @[Conv.scala 26:23]
  assign kernelDot_io_b_42 = im2col_io_outData_42; // @[Conv.scala 26:23]
  assign kernelDot_io_b_43 = im2col_io_outData_43; // @[Conv.scala 26:23]
  assign kernelDot_io_b_44 = im2col_io_outData_44; // @[Conv.scala 26:23]
  assign kernelDot_io_b_45 = im2col_io_outData_45; // @[Conv.scala 26:23]
  assign kernelDot_io_b_46 = im2col_io_outData_46; // @[Conv.scala 26:23]
  assign kernelDot_io_b_47 = im2col_io_outData_47; // @[Conv.scala 26:23]
  assign kernelDot_io_b_48 = im2col_io_outData_48; // @[Conv.scala 26:23]
  assign kernelDot_io_b_49 = im2col_io_outData_49; // @[Conv.scala 26:23]
  assign kernelDot_io_b_50 = im2col_io_outData_50; // @[Conv.scala 26:23]
  assign kernelDot_io_b_51 = im2col_io_outData_51; // @[Conv.scala 26:23]
  assign kernelDot_io_b_52 = im2col_io_outData_52; // @[Conv.scala 26:23]
  assign kernelDot_io_b_53 = im2col_io_outData_53; // @[Conv.scala 26:23]
  assign kernelDot_io_b_54 = im2col_io_outData_54; // @[Conv.scala 26:23]
  assign kernelDot_io_b_55 = im2col_io_outData_55; // @[Conv.scala 26:23]
  assign kernelDot_io_b_56 = im2col_io_outData_56; // @[Conv.scala 26:23]
  assign kernelDot_io_b_57 = im2col_io_outData_57; // @[Conv.scala 26:23]
  assign kernelDot_io_b_58 = im2col_io_outData_58; // @[Conv.scala 26:23]
  assign kernelDot_io_b_59 = im2col_io_outData_59; // @[Conv.scala 26:23]
  assign kernelDot_io_b_60 = im2col_io_outData_60; // @[Conv.scala 26:23]
  assign kernelDot_io_b_61 = im2col_io_outData_61; // @[Conv.scala 26:23]
  assign kernelDot_io_b_62 = im2col_io_outData_62; // @[Conv.scala 26:23]
  assign kernelDot_io_b_63 = im2col_io_outData_63; // @[Conv.scala 26:23]
endmodule
