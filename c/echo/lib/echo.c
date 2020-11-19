/**
 * @copyright 2020 YelloSoft
 *
 * @mainpage
 *
 * @ref main mirrors STDIN.
 */

#include <stdio.h>
#include <stdlib.h>

/**
 * @brief CLI entrypoint to mirror STDIN.
 */
int main() {
    int c = getchar();

    while (c != EOF) {
        (void) putchar(c);
        c = getchar();
    }

    return EXIT_SUCCESS;
}
