/* Copyright 2016 YelloSoft */

#include "fizzy.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stddef.h>
#include <string.h>

static void fizzy(char* s, size_t t, int i) {
    bool a = i % 3 == 0, b = i % 5 == 0;

    if (a && b) {
        strncpy(s, "FizzBuzz", 9);
    } else if (a) {
        strncpy(s, "Fizz", 5);
    } else if (b) {
        strncpy(s, "Buzz", 5);
    } else {
        (void) snprintf(s, t, "%d", i);
    }
}

int main() {
    char s[9];
    memset(s, 0, sizeof(s));

    for (int i = 1; i < 101; i++) {
        fizzy(s, 9, i);
        printf("%s\n", s);
    }

    return EXIT_SUCCESS;
}
