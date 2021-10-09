#include <cstdlib>

#include "Vtest_halfass.h"
#include "Vtest_halfass__Syms.h"

int main(int argc, char **argv) {
    int carry = 0;

    Verilated::commandArgs(argc, argv);

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            Vtest_halfass top{"top"};
            auto *ha = top.test_halfass;
            ha->a = i;
            ha->b = j;
            top.eval();
            carry = ha->carry;
            assert(carry == (i & j));

            if (!carry) {
                assert(ha->sum == (i ^ j));
            }
        }
    }

    return EXIT_SUCCESS;
}
