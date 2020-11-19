/**
 * @copyright 2020 YelloSoft
 */

#include "fizzy.hh"

#include <array>
#include <future>
#include <iostream>
#include <string>

using std::string;

/**
 * @brief fizzy reports the appropriate answer given a game state.
 *
 * @param n game state
 * @returns answer
 */
string fizzy(int const n) {
    auto a = n % 3, b = n % 5;

    if (a == 0 && b == 0) {
        return "FizzBuzz";
    } else if (a == 0) {
        return "Fizz";
    } else if (b == 0) {
        return "Buzz";
    } else {
        return std::to_string(n);
    }
}

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
