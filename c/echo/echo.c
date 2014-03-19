// Copyright (C) YelloSoft

#include <stdio.h>

int main() {
  int c = getchar();

  while (c != EOF) {
    (void) putchar(c);
    c = getchar();
  }

  return 0;
}
