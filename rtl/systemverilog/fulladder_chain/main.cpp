#include <cstdlib>

#include "Vfulladder_chain.h"
#include "Vfulladder_chain__Syms.h"

constexpr int len = 1 << WIDTH;
constexpr int min_unsigned = 0;
constexpr int max_unsigned = len - 1;
constexpr int min_signed = -1 * (1 << (WIDTH - 1));
constexpr int max_signed = (1 << (WIDTH - 1)) - 1;
constexpr int mask = max_unsigned;

int to_2c(int x) {
    if (x > -1) {
        return x;
    }

    x = -1 * x;
    x = (~x) & mask;
    x = (x + 1) & mask;
    return x;
}

int from_2c(int x) {
    if (!(x >> WIDTH)) {
        return x;
    }

    x = (~x) & mask;
    x = (x + 1) & mask;
    return -1 * x;
}

int main(int argc, char **argv) {
    int carry_out = 0;

    Verilated::commandArgs(argc, argv);

    for (int i = min_unsigned; i <= max_unsigned; i++) {
        for (int j = min_unsigned; j <= max_unsigned; j++) {
            Vfulladder_chain top{"top"};
            top.carry_in = 0;
            top.a = i;
            top.b = j;
            top.eval();
            carry_out = top.carry_out;
            assert(carry_out == ((i + j) > max_unsigned));

            if (!carry_out) {
                assert(top.sum == ((i + j) % len));
            }
        }
    }

    int sum = 0;

    for (int i = min_signed; i <= max_signed; i++) {
        for (int j = min_signed; j <= max_signed; j++) {
            Vfulladder_chain top{"top"};
            top.carry_in = 0;
            top.a = to_2c(i);
            top.b = to_2c(j);
            top.eval();
            sum = from_2c(top.sum);
            assert(sum == ((i + j) & mask));
        }
    }

    return EXIT_SUCCESS;
}
