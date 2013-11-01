#include <iostream>
using namespace std;

int main(int argc, char **argv) {
  int i;

  for (i = 0; i < argc; i++) {
    cout << argv[i];
  }

  return 0;
}
