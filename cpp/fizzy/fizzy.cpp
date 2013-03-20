#include <iostream>
#include <string>
#include <sstream>
#include <list>
#include <algorithm>
// #include <future>
using namespace std;

string fizzy(int n) {
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
  list<int> range(100, 0);
  iota(range.begin(), range.end(), 0);

  string strings[100];

  for_each(range.begin(), range.end(), [&](int i) {
      // std::async(
      //            launch::async,
      //            [&]() {
                   strings[i] = fizzy(i);
                 // }
                 // );
    });

  for_each(range.begin(), range.end(), [=](int i) {
      cout << strings[i] << endl;
    });
}

int main() { fizzbuzz(); }
