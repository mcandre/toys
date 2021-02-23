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

int main() {
    while (true) {
        int c = getchar();

        if (c == EOF) {
            return EXIT_SUCCESS;
        }

        errno = 0;
        (void) putchar(c);

        if (ferror(stdout)) {
            fprintf(stderr, "error writing character\n");
            return EXIT_FAILURE;
        }
    }
}
