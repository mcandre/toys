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
        strncpy(answer, fizz_buzz, strlen(fizz_buzz));
        return 1 + (int) strlen(fizz_buzz);
    } else if (a) {
        strncpy(answer, fizz, strlen(fizz));
        return 1 + (int) strlen(fizz);
    } else if (b) {
        strncpy(answer, buzz, strlen(buzz));
        return 1 + (int) strlen(buzz);
    }

    size_t len = (size_t) (2 + log(n));
    int bytes_written = snprintf(answer, len, "%u", n);

    if (bytes_written < 0 || bytes_written > (int) len) {
        return -1;
    }

    return 0;
}
