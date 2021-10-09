`include "fullass_chain.sv"

module test_fullass_chain;
    parameter WIDTH = 3;
    reg [WIDTH-1:0] a /* verilator public */,
                    b /* verilator public */;
    reg carry_in /* verilator public */;
    wire carry_out /* verilator public */;
    wire [WIDTH-1:0] sum /* verilator public */;
    fullass_chain #(.WIDTH(WIDTH)) fac(carry_in, a, b, carry_out, sum);
endmodule
