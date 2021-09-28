`include "half_adder.sv"

module test_half_adder;
    reg a00 = 0,
        b00 = 0;
    wire sum00,
         carry00;
    half_adder ha00(a00, b00, sum00, carry00);

    reg a01 = 0,
        b01 = 1;
    wire sum01,
         carry01;
    half_adder ha01(a01, b01, sum01, carry01);

    reg a10 = 1,
        b10 = 0;
    wire sum10,
         carry10;
    half_adder ha10(a10, b10, sum10, carry10);

    reg a11 = 1,
        b11 = 1;
    wire sum11,
         carry11;
    half_adder ha11(a11, b11, sum11, carry11);

    initial begin
        #1 assert (sum00 == 0);
        #1 assert (carry00 == 0);

        #1 assert (sum01 == 1);
        #1 assert (carry01 == 0);

        #1 assert (sum10 == 1);
        #1 assert (carry10 == 0);

        #1 assert (sum11 == 0);
        #1 assert (carry11 == 1);
    end
endmodule
