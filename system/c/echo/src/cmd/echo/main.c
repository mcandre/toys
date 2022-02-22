/**
 * @copyright 2020 YelloSoft
 * @mainpage
 *
 * Mirrors STDIN.
 */

#include <errno.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

/**
 * @brief main is the entrypoint.
 *
 * @returns CLI exit code
 */
int main(void) {
    while (true) {
        int c = 0;

        while ((c = getchar()) != EOF) {
            errno = 0;
            if (putchar(c) == EOF) {
                fprintf(stderr, "error writing character\n");
                return EXIT_FAILURE;
            }
        }

        return EXIT_SUCCESS;
    }
}
