/**
 * @copyright 2016 YelloSoft
 */

#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "fizzy/fizzy.h"

static char *fizz_buzz = "FizzBuzz";
static char *fizz = "Fizz";
static char *buzz = "Buzz";

int fizzy(char *answer, unsigned int n) {
    bool a = n % 3 == 0, b = n % 5 == 0;

    if (a && b) {
        memcpy(answer, fizz_buzz, 1 + strlen(fizz_buzz));
        return 0;
    } else if (a) {
        memcpy(answer, fizz, 1 + strlen(fizz));
        return 0;
    } else if (b) {
        memcpy(answer, buzz, 1 + strlen(buzz));
        return 0;
    }

    size_t sz = (size_t) (2 + log(n));
    int bytes_written = snprintf(answer, sz, "%u", n);

    if (bytes_written < 0 || (size_t) bytes_written > sz) {
        return -1;
    }

    return 0;
}
