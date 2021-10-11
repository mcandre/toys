#include <cstdlib>

#include "Vfulladder_chain.h"
#include "Vfulladder_chain__Syms.h"

int main(int argc, char **argv) {
    const int min = 0;
    const int len = 1 << WIDTH;
    const int max = len - 1;
    int carry_out = 0;

    Verilated::commandArgs(argc, argv);

    for (int i = min; i < len; i++) {
        for (int j = min; j < len; j++) {
            Vfulladder_chain top{"top"};
            top.carry_in = 0;
            top.a = i;
            top.b = j;
            top.eval();
            carry_out = top.carry_out;
            assert(carry_out == ((i + j) > max));

            if (!carry_out) {
                assert(top.sum == ((i + j) % len));
            }
        }
    }

    return EXIT_SUCCESS;
}
