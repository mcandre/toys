#include <iostream>
#include <string>
#include <sstream>
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
  int i;
  for (i = 1; i < 101; i++) {
    cout << fizzy(i) << endl;
  }
}

int main() {
  fizzbuzz();
}
