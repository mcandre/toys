/**
 * @copyright 2020 YelloSoft
 * @mainpage
 *
 * Lists CLI arguments.
 */

#include <iostream>
#include <string_view>
#include <vector>

/**
 * @brief main is the entrypoint.
 *
 * @param argc argument count
 * @param argv CLI arguments
 * @returns CLI exit code
 */
int main(int argc, const char **argv) {
    const std::vector<std::string_view> args{ argv, argv + argc };

    for (const std::string_view s : args) {
        std::cout << s << std::endl;
    }

    return EXIT_SUCCESS;
}
