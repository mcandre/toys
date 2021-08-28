/**
 * @copyright 2020 YelloSoft
 */

#include "fizzy++/fizzy++.hpp"

std::string fizzy::Fizzy(uint n) {
    const auto a = n % 3, b = n % 5;

    if (!(a | b)) {
        return "FizzBuzz";
    }

    if (!a) {
        return "Fizz";
    }

    if (!b) {
        return "Buzz";
    }

    return std::to_string(n);
}
