#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <numeric>

#ifdef ASYNC
#include <future>
#endif

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
  vector<int> range(100, 0);

#ifdef ASYNC
  iota(range.begin(), range.end(), 0);
#endif

  vector<string> strings(range.size(), "");

#ifdef ASYNC
  vector<future<void>> futures;
#endif

#ifdef AUTO
  for (auto i : range) {
#else
  size_t i;
  for (i = 0; i < range.size(); i++) {
#endif
#ifdef ASYNC
    futures.emplace_back(
      std::async(
        launch::async,
        [&]() {
#endif
          strings[i] = fizzy(i + 1);

#ifdef ASYNC
        }
      )
    );
#endif
  }

#ifdef AUTO
  for (auto s : strings) {
#else
  for (i = 0; i < strings.size(); i++) {
    string s = strings[i];
#endif
    cout << s << endl;
  }
}

int main() { fizzbuzz(); }
