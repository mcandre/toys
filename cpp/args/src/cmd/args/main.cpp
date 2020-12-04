/**
 * @copyright 2020 YelloSoft
 * @mainpage
 *
 * Lists CLI arguments.
 */

#include <iostream>
#include <string_view>
#include <vector>

int main(int const argc, char** const argv) {
    for (auto &&s : std::vector<std::string_view>{argv, argv+argc}) {
        std::cout << s << std::endl;
    }

    return EXIT_SUCCESS;
}
