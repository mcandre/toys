/* Copyright 2014 YelloSoft */

#include <iostream>
#include <iomanip>
using std::cout;

int main() {
  int c = getchar();

  while (c != EOF) {
    cout.put(c);
    c = getchar();
  }

  return 0;
}
