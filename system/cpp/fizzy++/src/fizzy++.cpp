/**
 * @copyright 2020 YelloSoft
 */

#include "fizzy++/fizzy++.hpp"

std::string fizzy::Fizzy(int n) {
    const auto a = n % 3, b = n % 5;

    if (!(a|b)) {
        return "FizzBuzz";
    } else if (!a) {
        return "Fizz";
    } else if (!b) {
        return "Buzz";
    }

    return std::to_string(n);
}
