// Copyright 2014 YelloSoft

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    bool b1 = true;
    bool b2 = false;

    int i1 = (int) b1;
    int i2 = (int) b2;

    printf("True is %d\n", i1);
    printf("False is %d\n", i2);

    return EXIT_SUCCESS;
}
