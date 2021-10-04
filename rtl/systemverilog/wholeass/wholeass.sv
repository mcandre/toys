module wholeass(input carry_in, a, b, output carry_out, sum);
    assign sum = a ^ b ^ carry_in;
    assign carry_out = (a & b) |
                       (a & carry_in) |
                       (b & carry_in);
endmodule

module adder #(parameter N = 2)(input carry_in, [N-1:0] a, [N-1:0] b, output carry_out, [N-1:0] sum);
    wholeass wa[N];

    generate
        for (int i = 1; i < N; i++) begin
            assign wa[i].carry_in = wa[i-1].carry_out;
            assign wa[i].a = a[i];
            assign wa[i].b = b[i];
            assign sum[i] = wa[i].sum;
        end
    endgenerate

    assign wa[0].carry_in = carry_in;
    assign carry_out = wa[N-1].carry_out;
endmodule
