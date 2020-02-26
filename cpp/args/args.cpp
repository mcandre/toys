/* Copyright 2010 YelloSoft */

#include <iostream>

int main(int const argc, char** const argv) {
    for (auto i = 0; i < argc; i++) {
        std::cout << argv[i] << std::endl;
    }

    return 0;
}
