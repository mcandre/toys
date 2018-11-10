// Copyright (C) YelloSoft

#include <stdio.h>
#include <stdlib.h>

int main() {
    int c = getchar();

    while (c != EOF) {
        (void) putchar(c);
        c = getchar();
    }

    return EXIT_SUCCESS;
}
