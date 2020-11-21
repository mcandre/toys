/**
 * @copyright 2016 YelloSoft
 */

#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "fizzy/fizzy.h"

static char *fizz_buzz = "FizzBuzz";
static char *fizz = "Fizz";
static char *buzz = "Buzz";

int fizzy(char *answer, size_t t, int n) {
    bool a = n % 3 == 0, b = n % 5 == 0;

    if (a && b) {
        return snprintf(answer, strlen(fizz_buzz)+1, "%s", fizz_buzz);
    } else if (a) {
        return snprintf(answer, strlen(fizz)+1, "%s", fizz);
    } else if (b) {
        return snprintf(answer, strlen(buzz)+1, "%s", buzz);
    }

    return snprintf(answer, t, "%d", n);
}
