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
        strncpy(s, "FizzBuzz", 8);
    } else if (a) {
        strncpy(s, "Fizz", 4);
    } else if (b) {
        strncpy(s, "Buzz", 4);
    } else {
        (void) snprintf(s, t, "%d", i);
    }
}

int main() {
    int i;

    for (i = 1; i < 101; i++) {
        char* s = (char*) calloc(9, sizeof(char));

        if (s != NULL) {
            fizzy(s, 9, i);

            printf("%s\n", s);

            free(s);
        }
    }

    return EXIT_SUCCESS;
}
