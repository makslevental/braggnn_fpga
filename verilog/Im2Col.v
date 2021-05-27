module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [15:0] io_enq_bits,
  output        io_deq_valid,
  output [15:0] io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] ram [0:14]; // @[Decoupled.scala 218:16]
  wire [15:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire [3:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [15:0] ram_MPORT_data; // @[Decoupled.scala 218:16]
  wire [3:0] ram_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] value; // @[Counter.scala 60:40]
  reg [3:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  wrap = value == 4'he; // @[Counter.scala 72:24]
  wire [3:0] _value_T_1 = value + 4'h1; // @[Counter.scala 76:24]
  wire  wrap_1 = value_1 == 4'he; // @[Counter.scala 72:24]
  wire [3:0] _value_T_3 = value_1 + 4'h1; // @[Counter.scala 76:24]
  assign ram_io_deq_bits_MPORT_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 4'hf ? _RAND_1[15:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 4'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 4'h0; // @[Counter.scala 60:40]
    end else if (io_deq_valid) begin // @[Decoupled.scala 233:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 4'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != io_deq_valid) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
  for (initvar = 0; initvar < 15; initvar = initvar+1)
    ram[initvar] = _RAND_0[15:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MemShiftRegister(
  input         clock,
  input         reset,
  input  [15:0] io_in_0,
  output [15:0] io_out_0
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] myMem [0:25]; // @[MemShiftRegister.scala 44:20]
  wire [15:0] myMem_uintOut_data; // @[MemShiftRegister.scala 44:20]
  wire [4:0] myMem_uintOut_addr; // @[MemShiftRegister.scala 44:20]
  wire [15:0] myMem_MPORT_data; // @[MemShiftRegister.scala 44:20]
  wire [4:0] myMem_MPORT_addr; // @[MemShiftRegister.scala 44:20]
  wire  myMem_MPORT_mask; // @[MemShiftRegister.scala 44:20]
  wire  myMem_MPORT_en; // @[MemShiftRegister.scala 44:20]
  reg [4:0] value; // @[Counter.scala 60:40]
  wire  wrap_wrap = value == 5'h19; // @[Counter.scala 72:24]
  wire [4:0] _wrap_value_T_1 = value + 5'h1; // @[Counter.scala 76:24]
  wire [4:0] _GEN_0 = wrap_wrap ? 5'h0 : _wrap_value_T_1; // @[Counter.scala 86:20 Counter.scala 86:28 Counter.scala 76:15]
  wire [5:0] readAddr = {{1'd0}, _GEN_0}; // @[MemShiftRegister.scala 47:24]
  reg [15:0] uintBuf; // @[MemShiftRegister.scala 63:26]
  assign myMem_uintOut_addr = readAddr[4:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign myMem_uintOut_data = myMem[myMem_uintOut_addr]; // @[MemShiftRegister.scala 44:20]
  `else
  assign myMem_uintOut_data = myMem_uintOut_addr >= 5'h1a ? _RAND_1[15:0] : myMem[myMem_uintOut_addr]; // @[MemShiftRegister.scala 44:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign myMem_MPORT_data = io_in_0;
  assign myMem_MPORT_addr = value;
  assign myMem_MPORT_mask = 1'h1;
  assign myMem_MPORT_en = 1'h1;
  assign io_out_0 = uintBuf; // @[MemShiftRegister.scala 67:28]
  always @(posedge clock) begin
    if(myMem_MPORT_en & myMem_MPORT_mask) begin
      myMem[myMem_MPORT_addr] <= myMem_MPORT_data; // @[MemShiftRegister.scala 44:20]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 5'h0; // @[Counter.scala 60:40]
    end else if (wrap_wrap) begin // @[Counter.scala 86:20]
      value <= 5'h0; // @[Counter.scala 86:28]
    end else begin
      value <= _wrap_value_T_1; // @[Counter.scala 76:15]
    end
    uintBuf <= myMem_uintOut_data; // @[MemShiftRegister.scala 63:26]
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
  for (initvar = 0; initvar < 26; initvar = initvar+1)
    myMem[initvar] = _RAND_0[15:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  uintBuf = _RAND_3[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Im2Col(
  input         clock,
  input         reset,
  input         io_dataIn_valid,
  input  [15:0] io_dataIn_bits_0,
  output        io_dataOut_valid,
  output [15:0] io_dataOut_bits_0,
  output [15:0] io_dataOut_bits_1,
  output [15:0] io_dataOut_bits_2,
  output [15:0] io_dataOut_bits_3,
  output [15:0] io_dataOut_bits_4,
  output [15:0] io_dataOut_bits_5,
  output [15:0] io_dataOut_bits_6,
  output [15:0] io_dataOut_bits_7,
  output [15:0] io_dataOut_bits_8,
  output [15:0] io_dataOut_bits_9,
  output [15:0] io_dataOut_bits_10,
  output [15:0] io_dataOut_bits_11,
  output [15:0] io_dataOut_bits_12,
  output [15:0] io_dataOut_bits_13,
  output [15:0] io_dataOut_bits_14,
  output [15:0] io_dataOut_bits_15,
  output [15:0] io_dataOut_bits_16,
  output [15:0] io_dataOut_bits_17,
  output [15:0] io_dataOut_bits_18,
  output [15:0] io_dataOut_bits_19,
  output [15:0] io_dataOut_bits_20,
  output [15:0] io_dataOut_bits_21,
  output [15:0] io_dataOut_bits_22,
  output [15:0] io_dataOut_bits_23,
  output [15:0] io_dataOut_bits_24,
  output [15:0] io_dataOut_bits_25,
  output [15:0] io_dataOut_bits_26,
  output [15:0] io_dataOut_bits_27,
  output [15:0] io_dataOut_bits_28,
  output [15:0] io_dataOut_bits_29,
  output [15:0] io_dataOut_bits_30,
  output [15:0] io_dataOut_bits_31,
  output [15:0] io_dataOut_bits_32,
  output [15:0] io_dataOut_bits_33,
  output [15:0] io_dataOut_bits_34,
  output [15:0] io_dataOut_bits_35,
  output [15:0] io_dataOut_bits_36,
  output [15:0] io_dataOut_bits_37,
  output [15:0] io_dataOut_bits_38,
  output [15:0] io_dataOut_bits_39,
  output [15:0] io_dataOut_bits_40,
  output [15:0] io_dataOut_bits_41,
  output [15:0] io_dataOut_bits_42,
  output [15:0] io_dataOut_bits_43,
  output [15:0] io_dataOut_bits_44,
  output [15:0] io_dataOut_bits_45,
  output [15:0] io_dataOut_bits_46,
  output [15:0] io_dataOut_bits_47,
  output [15:0] io_dataOut_bits_48
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
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
`endif // RANDOMIZE_REG_INIT
  wire  q_clock; // @[Decoupled.scala 296:21]
  wire  q_reset; // @[Decoupled.scala 296:21]
  wire  q_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  q_io_enq_valid; // @[Decoupled.scala 296:21]
  wire [15:0] q_io_enq_bits; // @[Decoupled.scala 296:21]
  wire  q_io_deq_valid; // @[Decoupled.scala 296:21]
  wire [15:0] q_io_deq_bits; // @[Decoupled.scala 296:21]
  wire  mb_memSR_clock; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_reset; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_io_in_0; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_io_out_0; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_1_clock; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_1_reset; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_1_io_in_0; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_1_io_out_0; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_2_clock; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_2_reset; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_2_io_in_0; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_2_io_out_0; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_3_clock; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_3_reset; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_3_io_in_0; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_3_io_out_0; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_4_clock; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_4_reset; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_4_io_in_0; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_4_io_out_0; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_5_clock; // @[MemShiftRegister.scala 21:23]
  wire  mb_memSR_5_reset; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_5_io_in_0; // @[MemShiftRegister.scala 21:23]
  wire [15:0] mb_memSR_5_io_out_0; // @[MemShiftRegister.scala 21:23]
  reg  vldIn_REG; // @[Im2Col.scala 54:19]
  reg [9:0] inCntr; // @[Counter.scala 60:40]
  wire [9:0] _wrap_value_T_1 = inCntr + 10'h1; // @[Counter.scala 76:24]
  wire [4:0] imCol = inCntr[4:0]; // @[Im2Col.scala 67:18]
  wire [4:0] imRow = inCntr[9:5]; // @[Im2Col.scala 71:18]
  wire [4:0] _prevRow_T = inCntr[9:5]; // @[Im2Col.scala 72:26]
  wire [4:0] _prevRow_T_3 = $signed(_prevRow_T) - 5'sh1; // @[Im2Col.scala 72:29]
  reg [15:0] bitsOut_0; // @[Im2Col.scala 75:20]
  reg [15:0] outputs_1_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_2_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_3_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_4_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_5_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_6_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_8_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_9_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_10_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_11_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_12_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_13_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_15_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_16_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_17_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_18_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_19_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_20_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_22_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_23_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_24_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_25_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_26_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_27_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_29_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_30_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_31_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_32_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_33_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_34_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_36_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_37_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_38_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_39_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_40_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_41_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_43_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_44_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_45_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_46_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_47_0; // @[Im2Col.scala 94:26]
  reg [15:0] outputs_48_0; // @[Im2Col.scala 94:26]
  reg [15:0] regOuts_0; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_1; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_2; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_3; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_4; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_5; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_6; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_7; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_8; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_9; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_10; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_11; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_12; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_13; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_14; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_15; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_16; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_17; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_18; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_19; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_20; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_21; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_22; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_23; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_24; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_25; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_26; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_27; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_28; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_29; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_30; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_31; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_32; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_33; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_34; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_35; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_36; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_37; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_38; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_39; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_40; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_41; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_42; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_43; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_44; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_45; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_46; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_47; // @[Im2Col.scala 104:20]
  reg [15:0] regOuts_48; // @[Im2Col.scala 104:20]
  wire  _T_4 = imCol < 5'h3; // @[Im2Col.scala 115:45]
  wire [15:0] _GEN_2 = imCol < 5'h3 ? 16'h0 : bitsOut_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [5:0] prevRow = {{1{_prevRow_T_3[4]}},_prevRow_T_3}; // @[Im2Col.scala 66:21 Im2Col.scala 72:11]
  wire  _T_11 = $signed(prevRow) < 6'sh3; // @[Im2Col.scala 123:45]
  wire  _T_17 = imRow < 5'h3; // @[Im2Col.scala 130:41]
  wire [15:0] _GEN_9 = 5'h1 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_1_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_10 = 5'h3 <= imCol & imCol < 5'h1 ? 16'h0 : _GEN_9; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_16 = 5'h2 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_2_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_17 = 5'h3 <= imCol & imCol < 5'h2 ? 16'h0 : _GEN_16; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire  _T_59 = 5'h3 <= imCol & _T_4; // @[Im2Col.scala 113:32]
  wire [15:0] _GEN_23 = _T_59 ? 16'h0 : outputs_3_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_24 = 5'h3 <= imCol & _T_4 ? 16'h0 : _GEN_23; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_30 = 5'h4 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_4_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_31 = 5'h3 <= imCol & imCol < 5'h4 ? 16'h0 : _GEN_30; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_37 = 5'h5 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_5_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_38 = 5'h3 <= imCol & imCol < 5'h5 ? 16'h0 : _GEN_37; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_44 = 5'h6 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_6_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_45 = 5'h3 <= imCol & imCol < 5'h6 ? 16'h0 : _GEN_44; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_51 = imCol < 5'h3 ? 16'h0 : mb_memSR_io_out_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_58 = 5'h1 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_8_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_59 = 5'h3 <= imCol & imCol < 5'h1 ? 16'h0 : _GEN_58; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_65 = 5'h2 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_9_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_66 = 5'h3 <= imCol & imCol < 5'h2 ? 16'h0 : _GEN_65; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_72 = _T_59 ? 16'h0 : outputs_10_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_73 = 5'h3 <= imCol & _T_4 ? 16'h0 : _GEN_72; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_79 = 5'h4 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_11_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_80 = 5'h3 <= imCol & imCol < 5'h4 ? 16'h0 : _GEN_79; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_86 = 5'h5 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_12_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_87 = 5'h3 <= imCol & imCol < 5'h5 ? 16'h0 : _GEN_86; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_93 = 5'h6 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_13_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_94 = 5'h3 <= imCol & imCol < 5'h6 ? 16'h0 : _GEN_93; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_100 = imCol < 5'h3 ? 16'h0 : mb_memSR_1_io_out_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_107 = 5'h1 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_15_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_108 = 5'h3 <= imCol & imCol < 5'h1 ? 16'h0 : _GEN_107; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_114 = 5'h2 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_16_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_115 = 5'h3 <= imCol & imCol < 5'h2 ? 16'h0 : _GEN_114; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_121 = _T_59 ? 16'h0 : outputs_17_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_122 = 5'h3 <= imCol & _T_4 ? 16'h0 : _GEN_121; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_128 = 5'h4 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_18_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_129 = 5'h3 <= imCol & imCol < 5'h4 ? 16'h0 : _GEN_128; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_135 = 5'h5 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_19_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_136 = 5'h3 <= imCol & imCol < 5'h5 ? 16'h0 : _GEN_135; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_142 = 5'h6 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_20_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_143 = 5'h3 <= imCol & imCol < 5'h6 ? 16'h0 : _GEN_142; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_149 = imCol < 5'h3 ? 16'h0 : mb_memSR_2_io_out_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire  _T_408 = 6'sh3 <= $signed(prevRow) & _T_11; // @[Im2Col.scala 120:36]
  wire  _T_414 = 5'h3 <= imRow & _T_17; // @[Im2Col.scala 127:34]
  wire [15:0] _GEN_156 = 5'h1 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_22_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_157 = 5'h3 <= imCol & imCol < 5'h1 ? 16'h0 : _GEN_156; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_163 = 5'h2 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_23_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_164 = 5'h3 <= imCol & imCol < 5'h2 ? 16'h0 : _GEN_163; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_170 = _T_59 ? 16'h0 : outputs_24_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_171 = 5'h3 <= imCol & _T_4 ? 16'h0 : _GEN_170; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_177 = 5'h4 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_25_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_178 = 5'h3 <= imCol & imCol < 5'h4 ? 16'h0 : _GEN_177; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_184 = 5'h5 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_26_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_185 = 5'h3 <= imCol & imCol < 5'h5 ? 16'h0 : _GEN_184; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_191 = 5'h6 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_27_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_192 = 5'h3 <= imCol & imCol < 5'h6 ? 16'h0 : _GEN_191; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_198 = imCol < 5'h3 ? 16'h0 : mb_memSR_3_io_out_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_205 = 5'h1 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_29_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_206 = 5'h3 <= imCol & imCol < 5'h1 ? 16'h0 : _GEN_205; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_212 = 5'h2 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_30_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_213 = 5'h3 <= imCol & imCol < 5'h2 ? 16'h0 : _GEN_212; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_219 = _T_59 ? 16'h0 : outputs_31_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_220 = 5'h3 <= imCol & _T_4 ? 16'h0 : _GEN_219; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_226 = 5'h4 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_32_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_227 = 5'h3 <= imCol & imCol < 5'h4 ? 16'h0 : _GEN_226; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_233 = 5'h5 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_33_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_234 = 5'h3 <= imCol & imCol < 5'h5 ? 16'h0 : _GEN_233; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_240 = 5'h6 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_34_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_241 = 5'h3 <= imCol & imCol < 5'h6 ? 16'h0 : _GEN_240; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_247 = imCol < 5'h3 ? 16'h0 : mb_memSR_4_io_out_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_254 = 5'h1 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_36_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_255 = 5'h3 <= imCol & imCol < 5'h1 ? 16'h0 : _GEN_254; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_261 = 5'h2 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_37_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_262 = 5'h3 <= imCol & imCol < 5'h2 ? 16'h0 : _GEN_261; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_268 = _T_59 ? 16'h0 : outputs_38_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_269 = 5'h3 <= imCol & _T_4 ? 16'h0 : _GEN_268; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_275 = 5'h4 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_39_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_276 = 5'h3 <= imCol & imCol < 5'h4 ? 16'h0 : _GEN_275; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_282 = 5'h5 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_40_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_283 = 5'h3 <= imCol & imCol < 5'h5 ? 16'h0 : _GEN_282; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_289 = 5'h6 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_41_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_290 = 5'h3 <= imCol & imCol < 5'h6 ? 16'h0 : _GEN_289; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_296 = imCol < 5'h3 ? 16'h0 : mb_memSR_5_io_out_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_303 = 5'h1 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_43_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_304 = 5'h3 <= imCol & imCol < 5'h1 ? 16'h0 : _GEN_303; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_310 = 5'h2 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_44_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_311 = 5'h3 <= imCol & imCol < 5'h2 ? 16'h0 : _GEN_310; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_317 = _T_59 ? 16'h0 : outputs_45_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_318 = 5'h3 <= imCol & _T_4 ? 16'h0 : _GEN_317; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_324 = 5'h4 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_46_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_325 = 5'h3 <= imCol & imCol < 5'h4 ? 16'h0 : _GEN_324; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_331 = 5'h5 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_47_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_332 = 5'h3 <= imCol & imCol < 5'h5 ? 16'h0 : _GEN_331; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  wire [15:0] _GEN_338 = 5'h6 <= imCol & imCol < 5'h3 ? 16'h0 : outputs_48_0; // @[Im2Col.scala 115:57 Im2Col.scala 116:30 Im2Col.scala 111:28]
  wire [15:0] _GEN_339 = 5'h3 <= imCol & imCol < 5'h6 ? 16'h0 : _GEN_338; // @[Im2Col.scala 113:51 Im2Col.scala 114:30]
  reg  vld_r; // @[Reg.scala 27:20]
  reg  vld_r_1; // @[Reg.scala 27:20]
  reg  vld_r_2; // @[Reg.scala 27:20]
  reg  vld_r_3; // @[Reg.scala 27:20]
  reg  vld_r_4; // @[Reg.scala 27:20]
  reg  vld_r_5; // @[Reg.scala 27:20]
  reg  vld_r_6; // @[Reg.scala 27:20]
  reg  vld_r_7; // @[Reg.scala 27:20]
  reg  vld_r_8; // @[Reg.scala 27:20]
  reg  vld_r_9; // @[Reg.scala 27:20]
  reg  vld_r_10; // @[Reg.scala 27:20]
  reg  vld_r_11; // @[Reg.scala 27:20]
  reg  vld_r_12; // @[Reg.scala 27:20]
  reg  vld_r_13; // @[Reg.scala 27:20]
  reg  vld_r_14; // @[Reg.scala 27:20]
  reg  vld_r_15; // @[Reg.scala 27:20]
  reg  vld_r_16; // @[Reg.scala 27:20]
  reg  vld_r_17; // @[Reg.scala 27:20]
  reg  vld_r_18; // @[Reg.scala 27:20]
  reg  vld_r_19; // @[Reg.scala 27:20]
  reg  vld_r_20; // @[Reg.scala 27:20]
  reg  vld_r_21; // @[Reg.scala 27:20]
  reg  vld_r_22; // @[Reg.scala 27:20]
  reg  vld_r_23; // @[Reg.scala 27:20]
  reg  vld_r_24; // @[Reg.scala 27:20]
  reg  vld_r_25; // @[Reg.scala 27:20]
  reg  vld_r_26; // @[Reg.scala 27:20]
  reg  vld_r_27; // @[Reg.scala 27:20]
  reg  vld_r_28; // @[Reg.scala 27:20]
  reg  vld_r_29; // @[Reg.scala 27:20]
  reg  vld_r_30; // @[Reg.scala 27:20]
  reg  vld_r_31; // @[Reg.scala 27:20]
  reg  vld_r_32; // @[Reg.scala 27:20]
  reg  vld_r_33; // @[Reg.scala 27:20]
  reg  vld_r_34; // @[Reg.scala 27:20]
  reg  vld_r_35; // @[Reg.scala 27:20]
  reg  vld_r_36; // @[Reg.scala 27:20]
  reg  vld_r_37; // @[Reg.scala 27:20]
  reg  vld_r_38; // @[Reg.scala 27:20]
  reg  vld_r_39; // @[Reg.scala 27:20]
  reg  vld_r_40; // @[Reg.scala 27:20]
  reg  vld_r_41; // @[Reg.scala 27:20]
  reg  vld_r_42; // @[Reg.scala 27:20]
  reg  vld_r_43; // @[Reg.scala 27:20]
  reg  vld_r_44; // @[Reg.scala 27:20]
  reg  vld_r_45; // @[Reg.scala 27:20]
  reg  vld_r_46; // @[Reg.scala 27:20]
  reg  vld_r_47; // @[Reg.scala 27:20]
  reg  vld_r_48; // @[Reg.scala 27:20]
  reg  vld_r_49; // @[Reg.scala 27:20]
  reg  vld_r_50; // @[Reg.scala 27:20]
  reg  vld_r_51; // @[Reg.scala 27:20]
  reg  vld_r_52; // @[Reg.scala 27:20]
  reg  vld_r_53; // @[Reg.scala 27:20]
  reg  vld_r_54; // @[Reg.scala 27:20]
  reg  vld_r_55; // @[Reg.scala 27:20]
  reg  vld_r_56; // @[Reg.scala 27:20]
  reg  vld_r_57; // @[Reg.scala 27:20]
  reg  vld_r_58; // @[Reg.scala 27:20]
  reg  vld_r_59; // @[Reg.scala 27:20]
  reg  vld_r_60; // @[Reg.scala 27:20]
  reg  vld_r_61; // @[Reg.scala 27:20]
  reg  vld_r_62; // @[Reg.scala 27:20]
  reg  vld_r_63; // @[Reg.scala 27:20]
  reg  vld_r_64; // @[Reg.scala 27:20]
  reg  vld_r_65; // @[Reg.scala 27:20]
  reg  vld_r_66; // @[Reg.scala 27:20]
  reg  vld_r_67; // @[Reg.scala 27:20]
  reg  vld_r_68; // @[Reg.scala 27:20]
  reg  vld_r_69; // @[Reg.scala 27:20]
  reg  vld_r_70; // @[Reg.scala 27:20]
  reg  vld_r_71; // @[Reg.scala 27:20]
  reg  vld_r_72; // @[Reg.scala 27:20]
  reg  vld_r_73; // @[Reg.scala 27:20]
  reg  vld_r_74; // @[Reg.scala 27:20]
  reg  vld_r_75; // @[Reg.scala 27:20]
  reg  vld_r_76; // @[Reg.scala 27:20]
  reg  vld_r_77; // @[Reg.scala 27:20]
  reg  vld_r_78; // @[Reg.scala 27:20]
  reg  vld_r_79; // @[Reg.scala 27:20]
  reg  vld_r_80; // @[Reg.scala 27:20]
  reg  vld_r_81; // @[Reg.scala 27:20]
  reg  vld_r_82; // @[Reg.scala 27:20]
  reg  vld_r_83; // @[Reg.scala 27:20]
  reg  vld_r_84; // @[Reg.scala 27:20]
  reg  vld_r_85; // @[Reg.scala 27:20]
  reg  vld_r_86; // @[Reg.scala 27:20]
  reg  vld_r_87; // @[Reg.scala 27:20]
  reg  vld_r_88; // @[Reg.scala 27:20]
  reg  vld_r_89; // @[Reg.scala 27:20]
  reg  vld_r_90; // @[Reg.scala 27:20]
  reg  vld_r_91; // @[Reg.scala 27:20]
  reg  vld_r_92; // @[Reg.scala 27:20]
  reg  vld_r_93; // @[Reg.scala 27:20]
  reg  vld_r_94; // @[Reg.scala 27:20]
  reg  vld_r_95; // @[Reg.scala 27:20]
  reg  vld_r_96; // @[Reg.scala 27:20]
  reg  vld_r_97; // @[Reg.scala 27:20]
  reg  vld_r_98; // @[Reg.scala 27:20]
  reg  vld; // @[Reg.scala 27:20]
  Queue q ( // @[Decoupled.scala 296:21]
    .clock(q_clock),
    .reset(q_reset),
    .io_enq_ready(q_io_enq_ready),
    .io_enq_valid(q_io_enq_valid),
    .io_enq_bits(q_io_enq_bits),
    .io_deq_valid(q_io_deq_valid),
    .io_deq_bits(q_io_deq_bits)
  );
  MemShiftRegister mb_memSR ( // @[MemShiftRegister.scala 21:23]
    .clock(mb_memSR_clock),
    .reset(mb_memSR_reset),
    .io_in_0(mb_memSR_io_in_0),
    .io_out_0(mb_memSR_io_out_0)
  );
  MemShiftRegister mb_memSR_1 ( // @[MemShiftRegister.scala 21:23]
    .clock(mb_memSR_1_clock),
    .reset(mb_memSR_1_reset),
    .io_in_0(mb_memSR_1_io_in_0),
    .io_out_0(mb_memSR_1_io_out_0)
  );
  MemShiftRegister mb_memSR_2 ( // @[MemShiftRegister.scala 21:23]
    .clock(mb_memSR_2_clock),
    .reset(mb_memSR_2_reset),
    .io_in_0(mb_memSR_2_io_in_0),
    .io_out_0(mb_memSR_2_io_out_0)
  );
  MemShiftRegister mb_memSR_3 ( // @[MemShiftRegister.scala 21:23]
    .clock(mb_memSR_3_clock),
    .reset(mb_memSR_3_reset),
    .io_in_0(mb_memSR_3_io_in_0),
    .io_out_0(mb_memSR_3_io_out_0)
  );
  MemShiftRegister mb_memSR_4 ( // @[MemShiftRegister.scala 21:23]
    .clock(mb_memSR_4_clock),
    .reset(mb_memSR_4_reset),
    .io_in_0(mb_memSR_4_io_in_0),
    .io_out_0(mb_memSR_4_io_out_0)
  );
  MemShiftRegister mb_memSR_5 ( // @[MemShiftRegister.scala 21:23]
    .clock(mb_memSR_5_clock),
    .reset(mb_memSR_5_reset),
    .io_in_0(mb_memSR_5_io_in_0),
    .io_out_0(mb_memSR_5_io_out_0)
  );
  assign io_dataOut_valid = vld; // @[Im2Col.scala 143:20]
  assign io_dataOut_bits_0 = regOuts_0; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_1 = regOuts_1; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_2 = regOuts_2; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_3 = regOuts_3; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_4 = regOuts_4; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_5 = regOuts_5; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_6 = regOuts_6; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_7 = regOuts_7; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_8 = regOuts_8; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_9 = regOuts_9; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_10 = regOuts_10; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_11 = regOuts_11; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_12 = regOuts_12; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_13 = regOuts_13; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_14 = regOuts_14; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_15 = regOuts_15; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_16 = regOuts_16; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_17 = regOuts_17; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_18 = regOuts_18; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_19 = regOuts_19; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_20 = regOuts_20; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_21 = regOuts_21; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_22 = regOuts_22; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_23 = regOuts_23; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_24 = regOuts_24; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_25 = regOuts_25; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_26 = regOuts_26; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_27 = regOuts_27; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_28 = regOuts_28; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_29 = regOuts_29; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_30 = regOuts_30; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_31 = regOuts_31; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_32 = regOuts_32; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_33 = regOuts_33; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_34 = regOuts_34; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_35 = regOuts_35; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_36 = regOuts_36; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_37 = regOuts_37; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_38 = regOuts_38; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_39 = regOuts_39; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_40 = regOuts_40; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_41 = regOuts_41; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_42 = regOuts_42; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_43 = regOuts_43; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_44 = regOuts_44; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_45 = regOuts_45; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_46 = regOuts_46; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_47 = regOuts_47; // @[Im2Col.scala 138:19]
  assign io_dataOut_bits_48 = regOuts_48; // @[Im2Col.scala 138:19]
  assign q_clock = clock;
  assign q_reset = reset;
  assign q_io_enq_valid = io_dataIn_valid; // @[Im2Col.scala 45:23 Im2Col.scala 47:19]
  assign q_io_enq_bits = io_dataIn_bits_0; // @[Im2Col.scala 45:23 Im2Col.scala 46:18]
  assign mb_memSR_clock = clock;
  assign mb_memSR_reset = reset;
  assign mb_memSR_io_in_0 = outputs_6_0; // @[MemShiftRegister.scala 23:17]
  assign mb_memSR_1_clock = clock;
  assign mb_memSR_1_reset = reset;
  assign mb_memSR_1_io_in_0 = outputs_13_0; // @[MemShiftRegister.scala 23:17]
  assign mb_memSR_2_clock = clock;
  assign mb_memSR_2_reset = reset;
  assign mb_memSR_2_io_in_0 = outputs_20_0; // @[MemShiftRegister.scala 23:17]
  assign mb_memSR_3_clock = clock;
  assign mb_memSR_3_reset = reset;
  assign mb_memSR_3_io_in_0 = outputs_27_0; // @[MemShiftRegister.scala 23:17]
  assign mb_memSR_4_clock = clock;
  assign mb_memSR_4_reset = reset;
  assign mb_memSR_4_io_in_0 = outputs_34_0; // @[MemShiftRegister.scala 23:17]
  assign mb_memSR_5_clock = clock;
  assign mb_memSR_5_reset = reset;
  assign mb_memSR_5_io_in_0 = outputs_41_0; // @[MemShiftRegister.scala 23:17]
  always @(posedge clock) begin
    vldIn_REG <= q_io_deq_valid; // @[Im2Col.scala 54:19]
    if (reset) begin // @[Counter.scala 60:40]
      inCntr <= 10'h0; // @[Counter.scala 60:40]
    end else if (vldIn_REG) begin // @[Counter.scala 118:17]
      inCntr <= _wrap_value_T_1; // @[Counter.scala 76:15]
    end
    bitsOut_0 <= q_io_deq_bits; // @[Im2Col.scala 49:22 Im2Col.scala 53:12]
    outputs_1_0 <= bitsOut_0; // @[Im2Col.scala 94:26]
    outputs_2_0 <= outputs_1_0; // @[Im2Col.scala 94:26]
    outputs_3_0 <= outputs_2_0; // @[Im2Col.scala 94:26]
    outputs_4_0 <= outputs_3_0; // @[Im2Col.scala 94:26]
    outputs_5_0 <= outputs_4_0; // @[Im2Col.scala 94:26]
    outputs_6_0 <= outputs_5_0; // @[Im2Col.scala 94:26]
    outputs_8_0 <= mb_memSR_io_out_0; // @[Im2Col.scala 94:26]
    outputs_9_0 <= outputs_8_0; // @[Im2Col.scala 94:26]
    outputs_10_0 <= outputs_9_0; // @[Im2Col.scala 94:26]
    outputs_11_0 <= outputs_10_0; // @[Im2Col.scala 94:26]
    outputs_12_0 <= outputs_11_0; // @[Im2Col.scala 94:26]
    outputs_13_0 <= outputs_12_0; // @[Im2Col.scala 94:26]
    outputs_15_0 <= mb_memSR_1_io_out_0; // @[Im2Col.scala 94:26]
    outputs_16_0 <= outputs_15_0; // @[Im2Col.scala 94:26]
    outputs_17_0 <= outputs_16_0; // @[Im2Col.scala 94:26]
    outputs_18_0 <= outputs_17_0; // @[Im2Col.scala 94:26]
    outputs_19_0 <= outputs_18_0; // @[Im2Col.scala 94:26]
    outputs_20_0 <= outputs_19_0; // @[Im2Col.scala 94:26]
    outputs_22_0 <= mb_memSR_2_io_out_0; // @[Im2Col.scala 94:26]
    outputs_23_0 <= outputs_22_0; // @[Im2Col.scala 94:26]
    outputs_24_0 <= outputs_23_0; // @[Im2Col.scala 94:26]
    outputs_25_0 <= outputs_24_0; // @[Im2Col.scala 94:26]
    outputs_26_0 <= outputs_25_0; // @[Im2Col.scala 94:26]
    outputs_27_0 <= outputs_26_0; // @[Im2Col.scala 94:26]
    outputs_29_0 <= mb_memSR_3_io_out_0; // @[Im2Col.scala 94:26]
    outputs_30_0 <= outputs_29_0; // @[Im2Col.scala 94:26]
    outputs_31_0 <= outputs_30_0; // @[Im2Col.scala 94:26]
    outputs_32_0 <= outputs_31_0; // @[Im2Col.scala 94:26]
    outputs_33_0 <= outputs_32_0; // @[Im2Col.scala 94:26]
    outputs_34_0 <= outputs_33_0; // @[Im2Col.scala 94:26]
    outputs_36_0 <= mb_memSR_4_io_out_0; // @[Im2Col.scala 94:26]
    outputs_37_0 <= outputs_36_0; // @[Im2Col.scala 94:26]
    outputs_38_0 <= outputs_37_0; // @[Im2Col.scala 94:26]
    outputs_39_0 <= outputs_38_0; // @[Im2Col.scala 94:26]
    outputs_40_0 <= outputs_39_0; // @[Im2Col.scala 94:26]
    outputs_41_0 <= outputs_40_0; // @[Im2Col.scala 94:26]
    outputs_43_0 <= mb_memSR_5_io_out_0; // @[Im2Col.scala 94:26]
    outputs_44_0 <= outputs_43_0; // @[Im2Col.scala 94:26]
    outputs_45_0 <= outputs_44_0; // @[Im2Col.scala 94:26]
    outputs_46_0 <= outputs_45_0; // @[Im2Col.scala 94:26]
    outputs_47_0 <= outputs_46_0; // @[Im2Col.scala 94:26]
    outputs_48_0 <= outputs_47_0; // @[Im2Col.scala 94:26]
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh0 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_0 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh0) begin // @[Im2Col.scala 120:57]
        regOuts_0 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_0 <= _GEN_2;
      end
    end else if (imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_0 <= 16'h0; // @[Im2Col.scala 131:32]
    end else begin
      regOuts_0 <= _GEN_2;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh0 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_1 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh0) begin // @[Im2Col.scala 120:57]
        regOuts_1 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_1 <= _GEN_10;
      end
    end else if (imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_1 <= 16'h0; // @[Im2Col.scala 131:32]
    end else begin
      regOuts_1 <= _GEN_10;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh0 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_2 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh0) begin // @[Im2Col.scala 120:57]
        regOuts_2 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_2 <= _GEN_17;
      end
    end else if (imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_2 <= 16'h0; // @[Im2Col.scala 131:32]
    end else begin
      regOuts_2 <= _GEN_17;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh0 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_3 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh0) begin // @[Im2Col.scala 120:57]
        regOuts_3 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_3 <= _GEN_24;
      end
    end else if (imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_3 <= 16'h0; // @[Im2Col.scala 131:32]
    end else begin
      regOuts_3 <= _GEN_24;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh0 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_4 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh0) begin // @[Im2Col.scala 120:57]
        regOuts_4 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_4 <= _GEN_31;
      end
    end else if (imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_4 <= 16'h0; // @[Im2Col.scala 131:32]
    end else begin
      regOuts_4 <= _GEN_31;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh0 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_5 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh0) begin // @[Im2Col.scala 120:57]
        regOuts_5 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_5 <= _GEN_38;
      end
    end else if (imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_5 <= 16'h0; // @[Im2Col.scala 131:32]
    end else begin
      regOuts_5 <= _GEN_38;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh0 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_6 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh0) begin // @[Im2Col.scala 120:57]
        regOuts_6 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_6 <= _GEN_45;
      end
    end else if (imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_6 <= 16'h0; // @[Im2Col.scala 131:32]
    end else begin
      regOuts_6 <= _GEN_45;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh1 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_7 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh1) begin // @[Im2Col.scala 120:57]
        regOuts_7 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_7 <= _GEN_51;
      end
    end else if (5'h1 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_7 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h1) begin // @[Im2Col.scala 127:53]
      regOuts_7 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_7 <= _GEN_51;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh1 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_8 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh1) begin // @[Im2Col.scala 120:57]
        regOuts_8 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_8 <= _GEN_59;
      end
    end else if (5'h1 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_8 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h1) begin // @[Im2Col.scala 127:53]
      regOuts_8 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_8 <= _GEN_59;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh1 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_9 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh1) begin // @[Im2Col.scala 120:57]
        regOuts_9 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_9 <= _GEN_66;
      end
    end else if (5'h1 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_9 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h1) begin // @[Im2Col.scala 127:53]
      regOuts_9 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_9 <= _GEN_66;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh1 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_10 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh1) begin // @[Im2Col.scala 120:57]
        regOuts_10 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_10 <= _GEN_73;
      end
    end else if (5'h1 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_10 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h1) begin // @[Im2Col.scala 127:53]
      regOuts_10 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_10 <= _GEN_73;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh1 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_11 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh1) begin // @[Im2Col.scala 120:57]
        regOuts_11 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_11 <= _GEN_80;
      end
    end else if (5'h1 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_11 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h1) begin // @[Im2Col.scala 127:53]
      regOuts_11 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_11 <= _GEN_80;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh1 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_12 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh1) begin // @[Im2Col.scala 120:57]
        regOuts_12 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_12 <= _GEN_87;
      end
    end else if (5'h1 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_12 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h1) begin // @[Im2Col.scala 127:53]
      regOuts_12 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_12 <= _GEN_87;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh1 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_13 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh1) begin // @[Im2Col.scala 120:57]
        regOuts_13 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_13 <= _GEN_94;
      end
    end else if (5'h1 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_13 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h1) begin // @[Im2Col.scala 127:53]
      regOuts_13 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_13 <= _GEN_94;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh2 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_14 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh2) begin // @[Im2Col.scala 120:57]
        regOuts_14 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_14 <= _GEN_100;
      end
    end else if (5'h2 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_14 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h2) begin // @[Im2Col.scala 127:53]
      regOuts_14 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_14 <= _GEN_100;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh2 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_15 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh2) begin // @[Im2Col.scala 120:57]
        regOuts_15 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_15 <= _GEN_108;
      end
    end else if (5'h2 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_15 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h2) begin // @[Im2Col.scala 127:53]
      regOuts_15 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_15 <= _GEN_108;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh2 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_16 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh2) begin // @[Im2Col.scala 120:57]
        regOuts_16 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_16 <= _GEN_115;
      end
    end else if (5'h2 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_16 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h2) begin // @[Im2Col.scala 127:53]
      regOuts_16 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_16 <= _GEN_115;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh2 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_17 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh2) begin // @[Im2Col.scala 120:57]
        regOuts_17 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_17 <= _GEN_122;
      end
    end else if (5'h2 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_17 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h2) begin // @[Im2Col.scala 127:53]
      regOuts_17 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_17 <= _GEN_122;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh2 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_18 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh2) begin // @[Im2Col.scala 120:57]
        regOuts_18 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_18 <= _GEN_129;
      end
    end else if (5'h2 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_18 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h2) begin // @[Im2Col.scala 127:53]
      regOuts_18 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_18 <= _GEN_129;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh2 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_19 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh2) begin // @[Im2Col.scala 120:57]
        regOuts_19 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_19 <= _GEN_136;
      end
    end else if (5'h2 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_19 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h2) begin // @[Im2Col.scala 127:53]
      regOuts_19 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_19 <= _GEN_136;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh2 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_20 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh2) begin // @[Im2Col.scala 120:57]
        regOuts_20 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_20 <= _GEN_143;
      end
    end else if (5'h2 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_20 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h2) begin // @[Im2Col.scala 127:53]
      regOuts_20 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_20 <= _GEN_143;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (_T_408) begin // @[Im2Col.scala 123:57]
        regOuts_21 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & _T_11) begin // @[Im2Col.scala 120:57]
        regOuts_21 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_21 <= _GEN_149;
      end
    end else if (_T_414) begin // @[Im2Col.scala 130:53]
      regOuts_21 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & _T_17) begin // @[Im2Col.scala 127:53]
      regOuts_21 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_21 <= _GEN_149;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (_T_408) begin // @[Im2Col.scala 123:57]
        regOuts_22 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & _T_11) begin // @[Im2Col.scala 120:57]
        regOuts_22 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_22 <= _GEN_157;
      end
    end else if (_T_414) begin // @[Im2Col.scala 130:53]
      regOuts_22 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & _T_17) begin // @[Im2Col.scala 127:53]
      regOuts_22 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_22 <= _GEN_157;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (_T_408) begin // @[Im2Col.scala 123:57]
        regOuts_23 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & _T_11) begin // @[Im2Col.scala 120:57]
        regOuts_23 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_23 <= _GEN_164;
      end
    end else if (_T_414) begin // @[Im2Col.scala 130:53]
      regOuts_23 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & _T_17) begin // @[Im2Col.scala 127:53]
      regOuts_23 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_23 <= _GEN_164;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (_T_408) begin // @[Im2Col.scala 123:57]
        regOuts_24 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & _T_11) begin // @[Im2Col.scala 120:57]
        regOuts_24 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_24 <= _GEN_171;
      end
    end else if (_T_414) begin // @[Im2Col.scala 130:53]
      regOuts_24 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & _T_17) begin // @[Im2Col.scala 127:53]
      regOuts_24 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_24 <= _GEN_171;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (_T_408) begin // @[Im2Col.scala 123:57]
        regOuts_25 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & _T_11) begin // @[Im2Col.scala 120:57]
        regOuts_25 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_25 <= _GEN_178;
      end
    end else if (_T_414) begin // @[Im2Col.scala 130:53]
      regOuts_25 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & _T_17) begin // @[Im2Col.scala 127:53]
      regOuts_25 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_25 <= _GEN_178;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (_T_408) begin // @[Im2Col.scala 123:57]
        regOuts_26 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & _T_11) begin // @[Im2Col.scala 120:57]
        regOuts_26 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_26 <= _GEN_185;
      end
    end else if (_T_414) begin // @[Im2Col.scala 130:53]
      regOuts_26 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & _T_17) begin // @[Im2Col.scala 127:53]
      regOuts_26 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_26 <= _GEN_185;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (_T_408) begin // @[Im2Col.scala 123:57]
        regOuts_27 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & _T_11) begin // @[Im2Col.scala 120:57]
        regOuts_27 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_27 <= _GEN_192;
      end
    end else if (_T_414) begin // @[Im2Col.scala 130:53]
      regOuts_27 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & _T_17) begin // @[Im2Col.scala 127:53]
      regOuts_27 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_27 <= _GEN_192;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh4 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_28 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh4) begin // @[Im2Col.scala 120:57]
        regOuts_28 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_28 <= _GEN_198;
      end
    end else if (5'h4 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_28 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h4) begin // @[Im2Col.scala 127:53]
      regOuts_28 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_28 <= _GEN_198;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh4 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_29 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh4) begin // @[Im2Col.scala 120:57]
        regOuts_29 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_29 <= _GEN_206;
      end
    end else if (5'h4 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_29 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h4) begin // @[Im2Col.scala 127:53]
      regOuts_29 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_29 <= _GEN_206;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh4 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_30 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh4) begin // @[Im2Col.scala 120:57]
        regOuts_30 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_30 <= _GEN_213;
      end
    end else if (5'h4 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_30 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h4) begin // @[Im2Col.scala 127:53]
      regOuts_30 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_30 <= _GEN_213;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh4 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_31 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh4) begin // @[Im2Col.scala 120:57]
        regOuts_31 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_31 <= _GEN_220;
      end
    end else if (5'h4 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_31 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h4) begin // @[Im2Col.scala 127:53]
      regOuts_31 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_31 <= _GEN_220;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh4 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_32 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh4) begin // @[Im2Col.scala 120:57]
        regOuts_32 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_32 <= _GEN_227;
      end
    end else if (5'h4 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_32 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h4) begin // @[Im2Col.scala 127:53]
      regOuts_32 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_32 <= _GEN_227;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh4 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_33 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh4) begin // @[Im2Col.scala 120:57]
        regOuts_33 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_33 <= _GEN_234;
      end
    end else if (5'h4 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_33 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h4) begin // @[Im2Col.scala 127:53]
      regOuts_33 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_33 <= _GEN_234;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh4 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_34 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh4) begin // @[Im2Col.scala 120:57]
        regOuts_34 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_34 <= _GEN_241;
      end
    end else if (5'h4 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_34 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h4) begin // @[Im2Col.scala 127:53]
      regOuts_34 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_34 <= _GEN_241;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh5 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_35 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh5) begin // @[Im2Col.scala 120:57]
        regOuts_35 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_35 <= _GEN_247;
      end
    end else if (5'h5 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_35 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h5) begin // @[Im2Col.scala 127:53]
      regOuts_35 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_35 <= _GEN_247;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh5 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_36 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh5) begin // @[Im2Col.scala 120:57]
        regOuts_36 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_36 <= _GEN_255;
      end
    end else if (5'h5 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_36 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h5) begin // @[Im2Col.scala 127:53]
      regOuts_36 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_36 <= _GEN_255;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh5 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_37 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh5) begin // @[Im2Col.scala 120:57]
        regOuts_37 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_37 <= _GEN_262;
      end
    end else if (5'h5 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_37 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h5) begin // @[Im2Col.scala 127:53]
      regOuts_37 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_37 <= _GEN_262;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh5 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_38 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh5) begin // @[Im2Col.scala 120:57]
        regOuts_38 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_38 <= _GEN_269;
      end
    end else if (5'h5 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_38 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h5) begin // @[Im2Col.scala 127:53]
      regOuts_38 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_38 <= _GEN_269;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh5 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_39 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh5) begin // @[Im2Col.scala 120:57]
        regOuts_39 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_39 <= _GEN_276;
      end
    end else if (5'h5 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_39 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h5) begin // @[Im2Col.scala 127:53]
      regOuts_39 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_39 <= _GEN_276;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh5 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_40 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh5) begin // @[Im2Col.scala 120:57]
        regOuts_40 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_40 <= _GEN_283;
      end
    end else if (5'h5 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_40 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h5) begin // @[Im2Col.scala 127:53]
      regOuts_40 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_40 <= _GEN_283;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh5 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_41 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh5) begin // @[Im2Col.scala 120:57]
        regOuts_41 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_41 <= _GEN_290;
      end
    end else if (5'h5 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_41 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h5) begin // @[Im2Col.scala 127:53]
      regOuts_41 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_41 <= _GEN_290;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh6 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_42 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh6) begin // @[Im2Col.scala 120:57]
        regOuts_42 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_42 <= _GEN_296;
      end
    end else if (5'h6 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_42 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h6) begin // @[Im2Col.scala 127:53]
      regOuts_42 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_42 <= _GEN_296;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh6 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_43 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh6) begin // @[Im2Col.scala 120:57]
        regOuts_43 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_43 <= _GEN_304;
      end
    end else if (5'h6 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_43 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h6) begin // @[Im2Col.scala 127:53]
      regOuts_43 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_43 <= _GEN_304;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh6 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_44 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh6) begin // @[Im2Col.scala 120:57]
        regOuts_44 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_44 <= _GEN_311;
      end
    end else if (5'h6 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_44 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h6) begin // @[Im2Col.scala 127:53]
      regOuts_44 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_44 <= _GEN_311;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh6 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_45 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh6) begin // @[Im2Col.scala 120:57]
        regOuts_45 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_45 <= _GEN_318;
      end
    end else if (5'h6 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_45 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h6) begin // @[Im2Col.scala 127:53]
      regOuts_45 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_45 <= _GEN_318;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh6 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_46 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh6) begin // @[Im2Col.scala 120:57]
        regOuts_46 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_46 <= _GEN_325;
      end
    end else if (5'h6 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_46 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h6) begin // @[Im2Col.scala 127:53]
      regOuts_46 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_46 <= _GEN_325;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh6 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_47 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh6) begin // @[Im2Col.scala 120:57]
        regOuts_47 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_47 <= _GEN_332;
      end
    end else if (5'h6 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_47 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h6) begin // @[Im2Col.scala 127:53]
      regOuts_47 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_47 <= _GEN_332;
    end
    if (_T_4) begin // @[Im2Col.scala 119:32]
      if (6'sh6 <= $signed(prevRow) & $signed(prevRow) < 6'sh3) begin // @[Im2Col.scala 123:57]
        regOuts_48 <= 16'h0; // @[Im2Col.scala 124:32]
      end else if (6'sh3 <= $signed(prevRow) & $signed(prevRow) < 6'sh6) begin // @[Im2Col.scala 120:57]
        regOuts_48 <= 16'h0; // @[Im2Col.scala 121:32]
      end else begin
        regOuts_48 <= _GEN_339;
      end
    end else if (5'h6 <= imRow & imRow < 5'h3) begin // @[Im2Col.scala 130:53]
      regOuts_48 <= 16'h0; // @[Im2Col.scala 131:32]
    end else if (5'h3 <= imRow & imRow < 5'h6) begin // @[Im2Col.scala 127:53]
      regOuts_48 <= 16'h0; // @[Im2Col.scala 128:32]
    end else begin
      regOuts_48 <= _GEN_339;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r <= vldIn_REG;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_1 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_1 <= vld_r;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_2 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_2 <= vld_r_1;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_3 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_3 <= vld_r_2;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_4 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_4 <= vld_r_3;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_5 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_5 <= vld_r_4;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_6 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_6 <= vld_r_5;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_7 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_7 <= vld_r_6;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_8 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_8 <= vld_r_7;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_9 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_9 <= vld_r_8;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_10 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_10 <= vld_r_9;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_11 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_11 <= vld_r_10;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_12 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_12 <= vld_r_11;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_13 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_13 <= vld_r_12;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_14 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_14 <= vld_r_13;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_15 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_15 <= vld_r_14;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_16 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_16 <= vld_r_15;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_17 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_17 <= vld_r_16;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_18 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_18 <= vld_r_17;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_19 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_19 <= vld_r_18;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_20 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_20 <= vld_r_19;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_21 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_21 <= vld_r_20;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_22 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_22 <= vld_r_21;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_23 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_23 <= vld_r_22;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_24 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_24 <= vld_r_23;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_25 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_25 <= vld_r_24;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_26 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_26 <= vld_r_25;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_27 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_27 <= vld_r_26;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_28 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_28 <= vld_r_27;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_29 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_29 <= vld_r_28;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_30 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_30 <= vld_r_29;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_31 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_31 <= vld_r_30;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_32 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_32 <= vld_r_31;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_33 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_33 <= vld_r_32;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_34 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_34 <= vld_r_33;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_35 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_35 <= vld_r_34;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_36 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_36 <= vld_r_35;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_37 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_37 <= vld_r_36;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_38 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_38 <= vld_r_37;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_39 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_39 <= vld_r_38;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_40 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_40 <= vld_r_39;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_41 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_41 <= vld_r_40;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_42 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_42 <= vld_r_41;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_43 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_43 <= vld_r_42;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_44 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_44 <= vld_r_43;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_45 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_45 <= vld_r_44;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_46 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_46 <= vld_r_45;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_47 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_47 <= vld_r_46;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_48 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_48 <= vld_r_47;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_49 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_49 <= vld_r_48;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_50 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_50 <= vld_r_49;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_51 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_51 <= vld_r_50;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_52 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_52 <= vld_r_51;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_53 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_53 <= vld_r_52;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_54 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_54 <= vld_r_53;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_55 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_55 <= vld_r_54;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_56 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_56 <= vld_r_55;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_57 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_57 <= vld_r_56;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_58 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_58 <= vld_r_57;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_59 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_59 <= vld_r_58;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_60 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_60 <= vld_r_59;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_61 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_61 <= vld_r_60;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_62 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_62 <= vld_r_61;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_63 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_63 <= vld_r_62;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_64 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_64 <= vld_r_63;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_65 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_65 <= vld_r_64;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_66 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_66 <= vld_r_65;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_67 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_67 <= vld_r_66;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_68 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_68 <= vld_r_67;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_69 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_69 <= vld_r_68;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_70 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_70 <= vld_r_69;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_71 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_71 <= vld_r_70;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_72 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_72 <= vld_r_71;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_73 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_73 <= vld_r_72;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_74 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_74 <= vld_r_73;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_75 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_75 <= vld_r_74;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_76 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_76 <= vld_r_75;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_77 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_77 <= vld_r_76;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_78 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_78 <= vld_r_77;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_79 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_79 <= vld_r_78;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_80 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_80 <= vld_r_79;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_81 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_81 <= vld_r_80;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_82 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_82 <= vld_r_81;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_83 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_83 <= vld_r_82;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_84 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_84 <= vld_r_83;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_85 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_85 <= vld_r_84;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_86 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_86 <= vld_r_85;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_87 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_87 <= vld_r_86;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_88 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_88 <= vld_r_87;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_89 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_89 <= vld_r_88;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_90 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_90 <= vld_r_89;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_91 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_91 <= vld_r_90;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_92 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_92 <= vld_r_91;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_93 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_93 <= vld_r_92;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_94 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_94 <= vld_r_93;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_95 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_95 <= vld_r_94;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_96 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_96 <= vld_r_95;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_97 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_97 <= vld_r_96;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld_r_98 <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld_r_98 <= vld_r_97;
    end
    if (reset) begin // @[Reg.scala 27:20]
      vld <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      vld <= vld_r_98;
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
  vldIn_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  inCntr = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  bitsOut_0 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  outputs_1_0 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  outputs_2_0 = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  outputs_3_0 = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  outputs_4_0 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  outputs_5_0 = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  outputs_6_0 = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  outputs_8_0 = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  outputs_9_0 = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  outputs_10_0 = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  outputs_11_0 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  outputs_12_0 = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  outputs_13_0 = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  outputs_15_0 = _RAND_15[15:0];
  _RAND_16 = {1{`RANDOM}};
  outputs_16_0 = _RAND_16[15:0];
  _RAND_17 = {1{`RANDOM}};
  outputs_17_0 = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  outputs_18_0 = _RAND_18[15:0];
  _RAND_19 = {1{`RANDOM}};
  outputs_19_0 = _RAND_19[15:0];
  _RAND_20 = {1{`RANDOM}};
  outputs_20_0 = _RAND_20[15:0];
  _RAND_21 = {1{`RANDOM}};
  outputs_22_0 = _RAND_21[15:0];
  _RAND_22 = {1{`RANDOM}};
  outputs_23_0 = _RAND_22[15:0];
  _RAND_23 = {1{`RANDOM}};
  outputs_24_0 = _RAND_23[15:0];
  _RAND_24 = {1{`RANDOM}};
  outputs_25_0 = _RAND_24[15:0];
  _RAND_25 = {1{`RANDOM}};
  outputs_26_0 = _RAND_25[15:0];
  _RAND_26 = {1{`RANDOM}};
  outputs_27_0 = _RAND_26[15:0];
  _RAND_27 = {1{`RANDOM}};
  outputs_29_0 = _RAND_27[15:0];
  _RAND_28 = {1{`RANDOM}};
  outputs_30_0 = _RAND_28[15:0];
  _RAND_29 = {1{`RANDOM}};
  outputs_31_0 = _RAND_29[15:0];
  _RAND_30 = {1{`RANDOM}};
  outputs_32_0 = _RAND_30[15:0];
  _RAND_31 = {1{`RANDOM}};
  outputs_33_0 = _RAND_31[15:0];
  _RAND_32 = {1{`RANDOM}};
  outputs_34_0 = _RAND_32[15:0];
  _RAND_33 = {1{`RANDOM}};
  outputs_36_0 = _RAND_33[15:0];
  _RAND_34 = {1{`RANDOM}};
  outputs_37_0 = _RAND_34[15:0];
  _RAND_35 = {1{`RANDOM}};
  outputs_38_0 = _RAND_35[15:0];
  _RAND_36 = {1{`RANDOM}};
  outputs_39_0 = _RAND_36[15:0];
  _RAND_37 = {1{`RANDOM}};
  outputs_40_0 = _RAND_37[15:0];
  _RAND_38 = {1{`RANDOM}};
  outputs_41_0 = _RAND_38[15:0];
  _RAND_39 = {1{`RANDOM}};
  outputs_43_0 = _RAND_39[15:0];
  _RAND_40 = {1{`RANDOM}};
  outputs_44_0 = _RAND_40[15:0];
  _RAND_41 = {1{`RANDOM}};
  outputs_45_0 = _RAND_41[15:0];
  _RAND_42 = {1{`RANDOM}};
  outputs_46_0 = _RAND_42[15:0];
  _RAND_43 = {1{`RANDOM}};
  outputs_47_0 = _RAND_43[15:0];
  _RAND_44 = {1{`RANDOM}};
  outputs_48_0 = _RAND_44[15:0];
  _RAND_45 = {1{`RANDOM}};
  regOuts_0 = _RAND_45[15:0];
  _RAND_46 = {1{`RANDOM}};
  regOuts_1 = _RAND_46[15:0];
  _RAND_47 = {1{`RANDOM}};
  regOuts_2 = _RAND_47[15:0];
  _RAND_48 = {1{`RANDOM}};
  regOuts_3 = _RAND_48[15:0];
  _RAND_49 = {1{`RANDOM}};
  regOuts_4 = _RAND_49[15:0];
  _RAND_50 = {1{`RANDOM}};
  regOuts_5 = _RAND_50[15:0];
  _RAND_51 = {1{`RANDOM}};
  regOuts_6 = _RAND_51[15:0];
  _RAND_52 = {1{`RANDOM}};
  regOuts_7 = _RAND_52[15:0];
  _RAND_53 = {1{`RANDOM}};
  regOuts_8 = _RAND_53[15:0];
  _RAND_54 = {1{`RANDOM}};
  regOuts_9 = _RAND_54[15:0];
  _RAND_55 = {1{`RANDOM}};
  regOuts_10 = _RAND_55[15:0];
  _RAND_56 = {1{`RANDOM}};
  regOuts_11 = _RAND_56[15:0];
  _RAND_57 = {1{`RANDOM}};
  regOuts_12 = _RAND_57[15:0];
  _RAND_58 = {1{`RANDOM}};
  regOuts_13 = _RAND_58[15:0];
  _RAND_59 = {1{`RANDOM}};
  regOuts_14 = _RAND_59[15:0];
  _RAND_60 = {1{`RANDOM}};
  regOuts_15 = _RAND_60[15:0];
  _RAND_61 = {1{`RANDOM}};
  regOuts_16 = _RAND_61[15:0];
  _RAND_62 = {1{`RANDOM}};
  regOuts_17 = _RAND_62[15:0];
  _RAND_63 = {1{`RANDOM}};
  regOuts_18 = _RAND_63[15:0];
  _RAND_64 = {1{`RANDOM}};
  regOuts_19 = _RAND_64[15:0];
  _RAND_65 = {1{`RANDOM}};
  regOuts_20 = _RAND_65[15:0];
  _RAND_66 = {1{`RANDOM}};
  regOuts_21 = _RAND_66[15:0];
  _RAND_67 = {1{`RANDOM}};
  regOuts_22 = _RAND_67[15:0];
  _RAND_68 = {1{`RANDOM}};
  regOuts_23 = _RAND_68[15:0];
  _RAND_69 = {1{`RANDOM}};
  regOuts_24 = _RAND_69[15:0];
  _RAND_70 = {1{`RANDOM}};
  regOuts_25 = _RAND_70[15:0];
  _RAND_71 = {1{`RANDOM}};
  regOuts_26 = _RAND_71[15:0];
  _RAND_72 = {1{`RANDOM}};
  regOuts_27 = _RAND_72[15:0];
  _RAND_73 = {1{`RANDOM}};
  regOuts_28 = _RAND_73[15:0];
  _RAND_74 = {1{`RANDOM}};
  regOuts_29 = _RAND_74[15:0];
  _RAND_75 = {1{`RANDOM}};
  regOuts_30 = _RAND_75[15:0];
  _RAND_76 = {1{`RANDOM}};
  regOuts_31 = _RAND_76[15:0];
  _RAND_77 = {1{`RANDOM}};
  regOuts_32 = _RAND_77[15:0];
  _RAND_78 = {1{`RANDOM}};
  regOuts_33 = _RAND_78[15:0];
  _RAND_79 = {1{`RANDOM}};
  regOuts_34 = _RAND_79[15:0];
  _RAND_80 = {1{`RANDOM}};
  regOuts_35 = _RAND_80[15:0];
  _RAND_81 = {1{`RANDOM}};
  regOuts_36 = _RAND_81[15:0];
  _RAND_82 = {1{`RANDOM}};
  regOuts_37 = _RAND_82[15:0];
  _RAND_83 = {1{`RANDOM}};
  regOuts_38 = _RAND_83[15:0];
  _RAND_84 = {1{`RANDOM}};
  regOuts_39 = _RAND_84[15:0];
  _RAND_85 = {1{`RANDOM}};
  regOuts_40 = _RAND_85[15:0];
  _RAND_86 = {1{`RANDOM}};
  regOuts_41 = _RAND_86[15:0];
  _RAND_87 = {1{`RANDOM}};
  regOuts_42 = _RAND_87[15:0];
  _RAND_88 = {1{`RANDOM}};
  regOuts_43 = _RAND_88[15:0];
  _RAND_89 = {1{`RANDOM}};
  regOuts_44 = _RAND_89[15:0];
  _RAND_90 = {1{`RANDOM}};
  regOuts_45 = _RAND_90[15:0];
  _RAND_91 = {1{`RANDOM}};
  regOuts_46 = _RAND_91[15:0];
  _RAND_92 = {1{`RANDOM}};
  regOuts_47 = _RAND_92[15:0];
  _RAND_93 = {1{`RANDOM}};
  regOuts_48 = _RAND_93[15:0];
  _RAND_94 = {1{`RANDOM}};
  vld_r = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  vld_r_1 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  vld_r_2 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  vld_r_3 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  vld_r_4 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  vld_r_5 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  vld_r_6 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  vld_r_7 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  vld_r_8 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  vld_r_9 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  vld_r_10 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  vld_r_11 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  vld_r_12 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  vld_r_13 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  vld_r_14 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  vld_r_15 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  vld_r_16 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  vld_r_17 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  vld_r_18 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  vld_r_19 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  vld_r_20 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  vld_r_21 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  vld_r_22 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  vld_r_23 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  vld_r_24 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  vld_r_25 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  vld_r_26 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  vld_r_27 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  vld_r_28 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  vld_r_29 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  vld_r_30 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  vld_r_31 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  vld_r_32 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  vld_r_33 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  vld_r_34 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  vld_r_35 = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  vld_r_36 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  vld_r_37 = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  vld_r_38 = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  vld_r_39 = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  vld_r_40 = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  vld_r_41 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  vld_r_42 = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  vld_r_43 = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  vld_r_44 = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  vld_r_45 = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  vld_r_46 = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  vld_r_47 = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  vld_r_48 = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  vld_r_49 = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  vld_r_50 = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  vld_r_51 = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  vld_r_52 = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  vld_r_53 = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  vld_r_54 = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  vld_r_55 = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  vld_r_56 = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  vld_r_57 = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  vld_r_58 = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  vld_r_59 = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  vld_r_60 = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  vld_r_61 = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  vld_r_62 = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  vld_r_63 = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  vld_r_64 = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  vld_r_65 = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  vld_r_66 = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  vld_r_67 = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  vld_r_68 = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  vld_r_69 = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  vld_r_70 = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  vld_r_71 = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  vld_r_72 = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  vld_r_73 = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  vld_r_74 = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  vld_r_75 = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  vld_r_76 = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  vld_r_77 = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  vld_r_78 = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  vld_r_79 = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  vld_r_80 = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  vld_r_81 = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  vld_r_82 = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  vld_r_83 = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  vld_r_84 = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  vld_r_85 = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  vld_r_86 = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  vld_r_87 = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  vld_r_88 = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  vld_r_89 = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  vld_r_90 = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  vld_r_91 = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  vld_r_92 = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  vld_r_93 = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  vld_r_94 = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  vld_r_95 = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  vld_r_96 = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  vld_r_97 = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  vld_r_98 = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  vld = _RAND_193[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
