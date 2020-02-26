/* Copyright 2014 YelloSoft */

#include <ios>
#include <iostream>

using std::cout;
using std::cin;
using std::noskipws;

int main() {
    char c;
    cin >> noskipws >> c;

    while (cin) {
        cout << c;
        cin >> noskipws >> c;
    }

    return 0;
}
