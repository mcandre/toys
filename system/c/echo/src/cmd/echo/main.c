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

int main(void) {
    while (true) {
        int c; // NOLINT(cppcoreguidelines-init-variables)

        if ((c = getchar()) == EOF) {
            return EXIT_SUCCESS;
        }

        errno = 0;
        if (putchar(c) == EOF) {
            fprintf(stderr, "error writing character\n");
            return EXIT_FAILURE;
        }
    }
}
