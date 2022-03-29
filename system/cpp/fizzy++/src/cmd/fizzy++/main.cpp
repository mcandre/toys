/**
 * @copyright 2020 YelloSoft
 */

#include <array>
#include <future>
#include <iostream>

#include "fizzy++/fizzy++.hpp"

/**
 * @brief main is the entrypoint.
 *
 * @param argc argument count
 * @param argv CLI arguments
 * @returns CLI exit code
 */
int main() {
    std::array<std::future<std::string>, 100> strings;

    for (int i{ 0 }; i < 100; i++) {
        strings[size_t(i)] =
            std::async(std::launch::async,
                       [=]() -> std::string { return fizzy::Fizzy(i + 1); });
    }

    for (std::future<std::string> &e : strings) {
        std::cout << e.get() << std::endl;
    }

    return EXIT_SUCCESS;
}
