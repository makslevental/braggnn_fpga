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
  reg [31:0] res; // @[OSProcElem.scala 16:20]
  reg [15:0] hreg; // @[OSProcElem.scala 17:21]
  reg [15:0] vreg; // @[OSProcElem.scala 18:21]
  wire [31:0] _res_T = io_inH * io_inV; // @[OSProcElem.scala 21:24]
  wire [31:0] _res_T_2 = res + _res_T; // @[OSProcElem.scala 21:14]
  assign io_outH = {{16'd0}, hreg}; // @[OSProcElem.scala 27:11]
  assign io_outV = {{16'd0}, vreg}; // @[OSProcElem.scala 28:11]
  assign io_out = res; // @[OSProcElem.scala 29:10]
  always @(posedge clock) begin
    if (reset) begin // @[OSProcElem.scala 16:20]
      res <= 32'h0; // @[OSProcElem.scala 16:20]
    end else begin
      res <= _res_T_2; // @[OSProcElem.scala 21:7]
    end
    if (reset) begin // @[OSProcElem.scala 17:21]
      hreg <= 16'h0; // @[OSProcElem.scala 17:21]
    end else begin
      hreg <= io_inH; // @[OSProcElem.scala 24:8]
    end
    if (reset) begin // @[OSProcElem.scala 18:21]
      vreg <= 16'h0; // @[OSProcElem.scala 18:21]
    end else begin
      vreg <= io_inV; // @[OSProcElem.scala 25:8]
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
