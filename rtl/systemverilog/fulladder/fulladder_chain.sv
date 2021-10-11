`include "fulladder.sv"

module fulladder_chain #(parameter WIDTH)(input carry_in, [WIDTH-1:0] a, [WIDTH-1:0] b, output carry_out, [WIDTH-1:0] sum);
    wire [WIDTH-2:0] carries /* verilator split_var */;
    fulladder fa_head(carry_in, a[0], b[0], carries[0], sum[0]);
    fulladder fa_tail(carries[WIDTH-2], a[WIDTH-1], b[WIDTH-1], carry_out, sum[WIDTH-1]);
    genvar i;

    generate
        for (i = 1; i < WIDTH - 1; i++)
            fulladder fa(carries[i-1], a[i], b[i], carries[i], sum[i]);
    endgenerate
endmodule
