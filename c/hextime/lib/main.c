/**
 * @copyright 2020 YelloSoft
 */

#include "hextime.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * @brief CLI entrypoint for displaying a hex clock.
 */
int main() {
    char result[7];
    memset(result, 0, sizeof(result));
    printf("%s\n", hex_now(result, 7));
    return EXIT_SUCCESS;
}
