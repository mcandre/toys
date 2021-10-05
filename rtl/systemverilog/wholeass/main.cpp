#include <cstdlib>

#include "Vtest_wholeass.h"
#include "Vtest_wholeass__Syms.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            Vtest_wholeass *top = new Vtest_wholeass{"top"};
            top->test_wholeass->a = i;
            top->test_wholeass->b = j;
            top->test_wholeass->carry_in = 0;
            top->eval();
            assert(top->test_wholeass->sum == ((i + j) % 8));
            assert(top->test_wholeass->carry_out == ((i + j) > 7));
            delete top;
        }
    }

    return EXIT_SUCCESS;
}
