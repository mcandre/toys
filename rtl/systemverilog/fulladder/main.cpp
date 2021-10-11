#include <cstdlib>

#include "Vfulladder_chain.h"
#include "Vfulladder_chain__Syms.h"

int main(int argc, char **argv) {
    const int min = 0;
    const int len = 1 << WIDTH;
    const int max = len - 1;

    Verilated::commandArgs(argc, argv);

    for (int i = min; i < len; i++) {
        for (int j = min; j < len; j++) {
            Vfulladder_chain top{"top"};
            top.carry_in = 0;
            top.a = i;
            top.b = j;
            top.eval();
            assert(top.carry_out == ((i + j) > max));
            assert(top.sum == ((i + j) % len));
        }
    }

    return EXIT_SUCCESS;
}
