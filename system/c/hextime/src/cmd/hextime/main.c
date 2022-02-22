/**
 * @copyright 2020 YelloSoft
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hextime/hextime.h"

/**
 * @brief main is the entrypoint.
 *
 * @returns CLI exit code
 */
int main(void) {
    char buf[6];

    if (hex_now(buf) < 0) {
        fprintf(stderr, "error encoding\n");
        return EXIT_FAILURE;
    }

    printf("%s\n", buf);
    return EXIT_SUCCESS;
}
