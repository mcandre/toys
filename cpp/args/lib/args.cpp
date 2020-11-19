/**
 * @copyright 2020 YelloSoft
 *
 * @mainpage
 *
 * @ref main displays CLI arguments.
 */

#include <iostream>
#include <string_view>
#include <vector>

/**
 * @brief CLI entrypoint for displaying CLI arguments
 *
 * @param argc 1 + count of ordinary CLI arguments
 * @param argv scriptname + ordinary CLI arguments
 */
int main(int const argc, char** const argv) {
    for (auto &&s : std::vector<std::string_view>{argv, argv+argc}) {
        std::cout << s << std::endl;
    }

    return 0;
}
