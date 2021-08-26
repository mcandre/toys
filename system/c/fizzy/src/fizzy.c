/**
 * @copyright 2016 YelloSoft
 */

#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "fizzy/fizzy.h"

static const char fizz_buzz[9] = "FizzBuzz";
static const size_t fizz_buzz_sz = sizeof(fizz_buzz);

static const char fizz[5] = "Fizz";
static const size_t fizz_sz = sizeof(fizz);

static const char buzz[5] = "Buzz";
static const size_t buzz_sz = sizeof(buzz);

void fizzy(char *answer, unsigned int n) {
    const bool a = n % 3 == 0, b = n % 5 == 0;

    if (a && b) {
        (void) snprintf(answer, fizz_buzz_sz, "%s", fizz_buzz);
        return;
    } else if (a) {
        (void) snprintf(answer, fizz_sz, "%s", fizz);
        return;
    } else if (b) {
        (void) snprintf(answer, buzz_sz, "%s", buzz);
        return;
    }

    const size_t sz = (size_t)(2 + log(n));
    (void) snprintf(answer, sz, "%u", n);
}
