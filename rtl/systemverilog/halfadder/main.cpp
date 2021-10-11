#include <cstdlib>

#include "Vhalfadder.h"
#include "Vhalfadder__Syms.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vhalfadder top{"top"};

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            top.a = i;
            top.b = j;
            top.eval();
            assert(top.carry == (i & j));
            assert(top.sum == (i ^ j));
        }
    }

    return EXIT_SUCCESS;
}
