/**
 * @copyright 2020 YelloSoft
 */

#include <array>
#include <future>
#include <iostream>

#include "fizzy++/fizzy++.hpp"

int main() {
    std::array<std::future<std::string>, 100> strings;

    for (auto i = 0; i < 100; i++) {
        strings[size_t(i)] = std::async(
            std::launch::async,
            [=]() -> std::string {
                return fizzy::Fizzy(i + 1);
            }
        );
    }

    for (auto &e : strings) {
        std::cout << e.get() << std::endl;
    }

    return EXIT_SUCCESS;
}
