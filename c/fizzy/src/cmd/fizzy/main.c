/**
 * @copyright 2016 YelloSoft
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "fizzy/fizzy.h"

int main() {
    char buf[9];

    for (unsigned int i = 1; i < 101; i++) {
        if (fizzy(buf, i) < 0) {
            fprintf(stderr, "error writing to buffer\n");
            return EXIT_FAILURE;
        }

        printf("%s\n", buf);
    }

    return EXIT_SUCCESS;
}
