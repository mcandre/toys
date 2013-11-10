#include <iostream>
using std::cout;
using std::endl;

int main(int argc, char **argv) {
  int i;

  for (i = 0; i < argc; i++) {
    cout << argv[i];
  }

  cout << endl;

  return 0;
}
