#include <cstdlib>

#include "Vtest_fulladder_chain.h"
#include "Vtest_fulladder_chain__Syms.h"

int main(int argc, char **argv) {
    const int width = 8;
    const int min = 0;
    const int len = 1 << width;
    const int max = len - 1;

    Verilated::commandArgs(argc, argv);

    for (int i = min; i < len; i++) {
        for (int j = min; j < len; j++) {
            Vtest_fulladder_chain top{"top"};
            auto *fa = top.test_fulladder_chain;
            fa->a = i;
            fa->b = j;
            fa->carry_in = 0;
            top.eval();
            assert(fa->carry_out == ((i + j) > max));
            assert(fa->sum == ((i + j) % len));
        }
    }

    return EXIT_SUCCESS;
}
