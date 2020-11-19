/**
 * @copyright 2016 YelloSoft
 */

#include "fizzy.h"

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
