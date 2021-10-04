`include "halfass.sv"

module test_halfass;
    reg c = 0,
        a = 0,
        b = 0;
    always #4 c = !c;
    always #2 a = !a;
    always #1 b = !b;

    wire sum,
        carry;
    halfass ha(a, b, sum, carry);

    always #1 begin
        #0 begin
            if (sum != a ^ b) $error("corrupt sum");
            if (carry != a & b) $error("corrupt carry");
            if (c == 1'b1) $finish();
        end
    end
endmodule
