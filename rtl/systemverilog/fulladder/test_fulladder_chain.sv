`include "fulladder_chain.sv"

module test_fulladder_chain;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] a /* verilator public */,
                    b /* verilator public */;
    reg carry_in /* verilator public */;
    wire carry_out /* verilator public */;
    wire [WIDTH-1:0] sum /* verilator public */;
    fulladder_chain #(.WIDTH(WIDTH)) fac(carry_in, a, b, carry_out, sum);
endmodule
