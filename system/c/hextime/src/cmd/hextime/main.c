/**
 * @copyright 2020 YelloSoft
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hextime/hextime.h"

int main() {
    char buf[6];
    hex_now(buf);
    printf("%s\n", buf);
    return EXIT_SUCCESS;
}
