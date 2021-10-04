`include "wholeass.sv"

module test_wholeass;
    reg c = 0,
        carry_in = 0;
    reg [2:0] a = 0,
        [2:0] b = 0;
    always #64 c = !c;
    always #8 a = a + 1;
    always #1 b = b + 1;

    wire [2:0] sum;
    wire carry_out;
    adder<3> wa(carry_in, a, b, carry_out, sum);

    always #1 begin
        #0 begin
            if (sum != a + b) $error("corrupt sum");
            if (carry_out != a + b > 7) $error("corrupt carry");
            if (c == 1'b1) $finish();
        end
    end
endmodule
