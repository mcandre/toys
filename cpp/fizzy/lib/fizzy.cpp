/* Copyright 2010 YelloSoft */

#include "fizzy.hh"

#include <array>
#include <future>
#include <iostream>
#include <string>

using std::string;

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

void fizzbuzz() {
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
}

int main() {
    fizzbuzz();
}
