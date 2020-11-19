/**
 * @copyright 2014 YelloSoft
 *
 * @mainpage
 *
 * @ref main processes CLI arguments.
 */

#include <stdio.h>
#include <stdlib.h>

/**
 * @brief CLI entrypoint
 *
 * @param argc 1 + number of ordinary CLI arguments
 * @param argv script name + ordinary CLI arguments
 */
int main(int argc, char **argv) {
    for (int i = 0; i < argc; i++) {
        printf("%s\n", argv[i]);
    }

    return EXIT_SUCCESS;
}
