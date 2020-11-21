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

    for (int i = 1; i < 101; i++) {
        int bytes_written = fizzy(s, sizeof(s)/sizeof(char), i);

        if (bytes_written < 0 || bytes_written > (int) sizeof(s)) {
            fprintf(stderr, "error writing to buffer\n");
            return EXIT_FAILURE;
        }

        printf("%s\n", s);
    }

    return EXIT_SUCCESS;
}
