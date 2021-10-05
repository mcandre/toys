`include "wholeass.sv"

module test_wholeass;
    parameter N = 3;
    reg [N-1:0] a /* verilator public */,
                b /* verilator public */;
    reg carry_in /* verilator public */;
    wire carry_out /* verilator public */;
    wire [N-1:0] sum /* verilator public */;
    wire [N-2:0] carries /* verilator split_var */;
    wholeass wa_head(carry_in, a[0], b[0], carries[0], sum[0]);
    wholeass wa_tail(carries[N-2], a[N-1], b[N-1], carry_out, sum[N-1]);
    genvar i;

    generate
        for (i = 1; i < N - 1; i++)
            wholeass wa(carries[i-1], a[i], b[i], carries[i], sum[i]);
    endgenerate
endmodule
