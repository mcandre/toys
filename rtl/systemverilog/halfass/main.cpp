#include <cstdlib>

#include "Vtest_halfass.h"
#include "Vtest_halfass__Syms.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            Vtest_halfass *top = new Vtest_halfass{"top"};
            top->test_halfass->a = i;
            top->test_halfass->b = j;
            top->eval();
            assert(top->test_halfass->sum == (i ^ j));
            assert(top->test_halfass->carry == (i & j));
            delete top;
        }
    }

    return EXIT_SUCCESS;
}
