/**
 * @copyright 2016 YelloSoft
 */

#include "fizzy.h"

#include <stdbool.h>
#include <stdio.h>
#include <string.h>

void fizzy(char* s, size_t t, int n) {
    bool a = n % 3 == 0, b = n % 5 == 0;

    if (a && b) {
        strncpy(s, "FizzBuzz", 9);
    } else if (a) {
        strncpy(s, "Fizz", 5);
    } else if (b) {
        strncpy(s, "Buzz", 5);
    } else {
        (void) snprintf(s, t, "%d", n);
    }
}
