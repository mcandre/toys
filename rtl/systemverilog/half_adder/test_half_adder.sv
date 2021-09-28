`include "half_adder.sv"

module test_half_adder;
    wire sum00,
         carry00;
    half_adder ha00(1'b0, 1'b0, sum00, carry00);

    wire sum01,
         carry01;
    half_adder ha01(1'b0, 1'b1, sum01, carry01);

    wire sum10,
         carry10;
    half_adder ha10(1'b1, 1'b0, sum10, carry10);

    wire sum11,
         carry11;
    half_adder ha11(1'b1, 1'b1, sum11, carry11);

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
