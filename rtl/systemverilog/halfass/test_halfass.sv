`include "halfass.sv"

module test_halfass;
    reg a /* verilator public */,
        b /* verilator public */;
    wire sum /* verilator public */,
        carry /* verilator public */;
    halfass ha(a, b, sum, carry);
endmodule
