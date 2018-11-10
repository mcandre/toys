/* Copyright 2010 YelloSoft */

#include "fizzy.h"

#include <future>
#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <numeric>

using std::cout;
using std::endl;
using std::string;
using std::stringstream;
using std::vector;
using std::future;
using std::launch;

string fizzy(int const n) {
    int a = n % 3, b = n % 5;

    if (a == 0 && b == 0) {
        return "FizzBuzz";
    }
    else if (a == 0) {
        return "Fizz";
    }
    else if (b == 0) {
        return "Buzz";
    }
    else {
        stringstream out;
        out << n;
        return out.str();
    }
}

void fizzbuzz() {
    vector<int> range(100, 0);
    iota(range.begin(), range.end(), 0);

    vector<future<string>> strings(range.size());

    for (auto i : range) {
        strings[(size_t) i] = std::async(
            launch::async,
            [=]() -> string {
                return fizzy((int) (i + 1));
            }
        );
    }

    for (auto& s : strings) {
        cout << s.get() << endl;
    }
}

int main() { fizzbuzz(); }
