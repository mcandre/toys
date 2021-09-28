module half_adder(
    input a,
    b,
    output sum,
    carry
);

    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module test_half_adder;
    reg a = 0,
        b = 0;
    always #2 b = !b;
    always #4 a = !a;

    wire sum,
         carry;

    half_adder ha(a, b, sum, carry);

    initial
        $monitor(
            "Time: %t, a: %0d, b: %0d, sum: %0d, carry: %0d",
            $time,
            a,
            b,
            sum,
            carry
        );
endmodule
