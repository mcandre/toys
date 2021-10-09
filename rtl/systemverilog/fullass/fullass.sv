module fullass(input carry_in, a, b, output carry_out, sum);
    assign sum = a ^ b ^ carry_in;
    assign carry_out = (a & b) |
                       (a & carry_in) |
                       (b & carry_in);
endmodule
