/**
 * @copyright 2020 YelloSoft
 */

#include "fizzy.hh"

#include <array>
#include <future>
#include <iostream>

/**
 * @brief CLI entrypoint playing a game of FizzBuzz
 */
int main() {
    std::array<std::future<string>, 100> strings;

    for (auto i = 0; i < 100; i++) {
        strings[size_t(i)] = std::async(
            std::launch::async,
            [=]() -> string {
                return fizzy(i + 1);
            }
        );
    }

    for (auto &e : strings) {
        std::cout << e.get() << std::endl;
    }

    return EXIT_SUCCESS;
}
