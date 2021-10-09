#include <cstdlib>

#include "Vtest_fullass.h"
#include "Vtest_fullass__Syms.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            auto *top = new Vtest_fullass{"top"};
            top->test_fullass->a = i;
            top->test_fullass->b = j;
            top->test_fullass->carry_in = 0;
            top->eval();
            assert(top->test_fullass->sum == ((i + j) % 8));
            assert(top->test_fullass->carry_out == ((i + j) > 7));
            delete top;
        }
    }

    return EXIT_SUCCESS;
}
