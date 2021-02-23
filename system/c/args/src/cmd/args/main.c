/**
 * @copyright 2014 YelloSoft
 * @mainpage
 *
 * Displays CLI arguments.
 */

#include <stdio.h>
#include <stdlib.h>

int main(const int argc, const char **argv) {
    for (int i = 0; i < argc; i++) {
        printf("%s\n", argv[i]);
    }

    return EXIT_SUCCESS;
}
