/**
 * @copyright 2016 YelloSoft
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "fizzy/fizzy.h"

int main() {
    char buf[9];
    const size_t buf_sz = sizeof(buf);

    for (unsigned int i = 1; i < 101; i++) {
        memset(buf, 0, buf_sz);
        fizzy(buf, i);
        printf("%s\n", buf);
    }

    return EXIT_SUCCESS;
}
