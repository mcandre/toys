/**
 * @copyright 2016 YelloSoft
 */

#include "fizzy.h"

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stddef.h>
#include <string.h>

/**
 * @brief fizzy reports the appropriate answer given a game state.
 *
 * @param s answer buffer
 * @param t answer buffer length, in characters
 * @param n game state
 */
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

/**
 * @brief CLI entrypoint to play a game of FizzBuzz
 *
 */
int main() {
    char s[9];
    memset(s, 0, sizeof(s));

    for (int i = 1; i < 101; i++) {
        fizzy(s, 9, i);
        printf("%s\n", s);
    }

    return EXIT_SUCCESS;
}
