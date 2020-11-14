/* Copyright 2010 YelloSoft */

#include <iostream>
#include <string_view>
#include <vector>

int main(int const argc, char** const argv) {
    for (auto &&s : std::vector<std::string_view>{argv, argv+argc}) {
        std::cout << s << std::endl;
    }

    return 0;
}
