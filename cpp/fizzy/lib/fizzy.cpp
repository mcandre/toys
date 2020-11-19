/**
 * @copyright 2020 YelloSoft
 */

#include "fizzy.hh"

#include <string>

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
