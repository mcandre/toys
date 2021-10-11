#include <cstdlib>

#include "Vtest_halfadder.h"
#include "Vtest_halfadder__Syms.h"

int main(int argc, char **argv) {
    int carry = 0;

    Verilated::commandArgs(argc, argv);

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            Vtest_halfadder top{"top"};
            auto *ha = top.test_halfadder;
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
