/**
 * @copyright 2020 YelloSoft
 * @mainpage
 *
 * Mirrors STDIN.
 */

#include <stdio.h>
#include <stdlib.h>

/** @private */
int main() {
    int c = getchar();

    while (c != EOF) {
        (void) putchar(c);
        c = getchar();
    }

    return EXIT_SUCCESS;
}
