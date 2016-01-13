/* Copyright 2016 YelloSoft */

#include "fizzy.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

void fizzy(char* s, int i) {
  bool a = i % 3 == 0, b = i % 5 == 0;

  if (a && b) {
    strncpy(s, "FizzBuzz", 8);
  } else if (a) {
    strncpy(s, "Fizz", 4);
  } else if (b) {
    strncpy(s, "Buzz", 4);
  } else {
    sprintf(s, "%d", i);
  }
}

int main() {
  int i;

  for (i = 1; i < 101; i++) {
    char* s = (char*) calloc(9, sizeof(char));
    fizzy(s, i);

    printf("%s\n", s);

    free(s);
  }

  return 0;
}
