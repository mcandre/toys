/**
 * @copyright 2020 YelloSoft
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hextime/hextime.h"

int main() {
    char result[5];
    memset(result, 0, sizeof(result));
    printf("%s\n", hex_now(result, sizeof(result)/sizeof(char)));
    return EXIT_SUCCESS;
}
