`include "wholeass.sv"

module test_wholeass;
    parameter N = 3;

    reg c = 0,
        carry_in = 0;
    reg [N-1:0] a = 0,
                b = 0;
    always #64 c = !c;
    always #8 a = a + 1;
    always #1 b = b + 1;

    wire carry_out;
    wire [N-1:0] sum;

    wholeass wa[N];
    genvar i;

    generate
        for (i = 1; i < N; i++) begin
            assign wa[i].carry_in = wa[i-1].carry_out;
            assign wa[i].a = a[i];
            assign wa[i].b = b[i];
            assign sum[i] = wa[i].sum;
        end
    endgenerate

    assign wa[0].carry_in = carry_in;
    assign sum[0] = wa[0].sum;
    assign carry_out = wa[N-1].carry_out;

    always #1 begin
        #0 begin
            if (sum != a + b) $error("corrupt sum");
            if (carry_out != a + b > 7) $error("corrupt carry");
            if (c == 1'b1) $finish();
        end
    end
endmodule
