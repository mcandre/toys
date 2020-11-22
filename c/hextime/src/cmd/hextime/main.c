/**
 * @copyright 2020 YelloSoft
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hextime/hextime.h"

int main() {
    char result[6];

    if (hex_now(result) < 0) {
        fprintf(stderr, "error writing to buffer\n");
        return EXIT_FAILURE;
    }

    printf("%s\n", result);
    return EXIT_SUCCESS;
}
