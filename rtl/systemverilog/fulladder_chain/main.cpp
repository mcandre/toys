#include <cstdlib>

#include "Vfulladder_chain.h"
#include "Vfulladder_chain__Syms.h"

constexpr int len = 1 << WIDTH;
constexpr int min_unsigned = 0;
constexpr int max_unsigned = len - 1;
constexpr int min_signed = -1 * (1 << (WIDTH - 1));
constexpr int max_signed = (1 << (WIDTH - 1)) - 1;
constexpr int mask = max_unsigned;

static int to_2c(int x) {
    if (x > -1) {
        return x;
    }

    x = -1 * x;
    x = (~x) & mask;
    x = (x + 1) & mask;
    return x;
}

static int from_2c(int x) {
    if (!(x >> WIDTH)) {
        return x;
    }

    x = (~x) & mask;
    x = (x + 1) & mask;
    return -1 * x;
}

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vfulladder_chain top{"top"};
    top.carry_in = 0;

    for (int i = min_unsigned; i <= max_unsigned; i++) {
        for (int j = min_unsigned; j <= max_unsigned; j++) {
            top.a = i;
            top.b = j;
            top.eval();
            assert(top.carry_out == ((i + j) > max_unsigned));
            assert(top.sum == ((i + j) % len));
        }
    }

    for (int i = min_signed; i <= max_signed; i++) {
        for (int j = min_signed; j <= max_signed; j++) {
            top.a = to_2c(i);
            top.b = to_2c(j);
            top.eval();
            assert(from_2c(top.sum) == ((i + j) & mask));
        }
    }

    return EXIT_SUCCESS;
}
