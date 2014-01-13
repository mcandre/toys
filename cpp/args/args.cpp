#include <iostream>
using std::cout;
using std::endl;

int main(int const argc, char** const argv) {
  int i;

  for (i = 0; i < argc; i++) {
    cout << argv[i];
  }

  cout << endl;

  return 0;
}
