/**
 * @copyright 2020 YelloSoft
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hextime/hextime.h"

int main() {
    char result[6];
    int bytes_written = hex_now(result, sizeof(result)/sizeof(char));

    if (bytes_written < 0 || bytes_written > (int) sizeof(result)) {
        fprintf(stderr, "error writing to buffer\n");
        return EXIT_FAILURE;
    }

    printf("%s\n", result);
    return EXIT_SUCCESS;
}
