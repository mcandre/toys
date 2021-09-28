module half_adder(
    input clk,
    a,
    b,
    output reg sum,
    carry
);
    always @(posedge clk)
        begin
            sum <= a ^ b;
            carry <= a & b;
        end
endmodule

module test_half_adder;
    reg clk = 0;
    always #1 clk = !clk;

    reg a = 0,
        b = 0;
    always #2 b = !b;
    always #4 a = !a;

    wire sum,
         carry;

    half_adder ha(clk, a, b, sum, carry);

    initial
        $monitor(
            "Time: %t, clk: %0d, a: %0d, b: %0d, sum: %0d, carry: %0d",
            $time,
            clk,
            a,
            b,
            sum,
            carry
        );
endmodule
