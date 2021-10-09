#include <cstdlib>

#include "Vtest_fullass.h"
#include "Vtest_fullass__Syms.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            Vtest_fullass top{"top"};
            auto *fa = top.test_fullass;
            fa->a = i;
            fa->b = j;
            fa->carry_in = 0;
            top.eval();
            assert(fa->sum == ((i + j) % 8));
            assert(fa->carry_out == ((i + j) > 7));
        }
    }

    return EXIT_SUCCESS;
}
