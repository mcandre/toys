/* Copyright 2010 YelloSoft */

#include <iostream>
#include <vector>
#include <numeric>
using std::cout;
using std::endl;
using std::vector;

int main(int const argc, char** const argv) {
  vector<int> range((size_t) argc, 0);
  iota(range.begin(), range.end(), 0);

  for (auto i : range) {
    cout << argv[i] << endl;
  }

  return 0;
}
