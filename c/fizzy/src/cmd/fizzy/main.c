/**
 * @copyright 2016 YelloSoft
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "fizzy/fizzy.h"

/** @private */
int main() {
    char s[9];
    memset(s, 0, sizeof(s));

    for (int i = 1; i < 101; i++) {
        fizzy(s, sizeof(s)/sizeof(char), i);
        printf("%s\n", s);
    }

    return EXIT_SUCCESS;
}
