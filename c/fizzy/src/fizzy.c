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

int fizzy(char *answer, size_t answer_size, int n) {
    if (answer_size < 1 + strlen(fizz_buzz) || log(n) > (double) answer_size - 2) {
        return -1;
    }

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

    return snprintf(answer, answer_size, "%d", n);
}
