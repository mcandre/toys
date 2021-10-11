`include "halfadder.sv"

module test_halfadder;
    reg a /* verilator public */,
        b /* verilator public */;
    wire sum /* verilator public */,
        carry /* verilator public */;
    halfadder ha(a, b, sum, carry);
endmodule
