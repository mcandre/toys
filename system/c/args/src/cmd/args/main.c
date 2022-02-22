/**
 * @copyright 2014 YelloSoft
 * @mainpage
 *
 * Displays CLI arguments.
 */

#include <stdio.h>
#include <stdlib.h>

/**
 * @brief main is the entrypoint.
 *
 * @param argc argument count
 * @param argv CLI arguments
 * @returns CLI exit code
 */
int main(int argc, const char **argv) {
    for (int i = 0; i < argc; i++) {
        printf("%s\n", argv[i]);
    }

    return EXIT_SUCCESS;
}
