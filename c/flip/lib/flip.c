// Copyright 2010-2014 YelloSoft

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

static void __attribute__((noreturn)) usage(char *const program) {
    printf("Usage: %s [file|file.flip]\n", program);
    printf("\nFlip will invert the bits and create a .flip file.\n");
    printf("Flipping a file twice restores the original.\n");
}

int main(int const argc, char **const argv) {
    char *filename;
    char *flipname;
    size_t len;
    FILE *source;
    FILE *dest;
    int b;

    if (argc != 2) {
        usage(argv[0]);
        return EXIT_FAILURE;
    }

    filename = argv[1];

    len = strlen(filename);

    if (len > 5 && strcmp(filename + len - 5, ".flip") == 0) {
        flipname = (char *) calloc(len - 4, sizeof(char));
        assert(flipname != NULL);

        strncpy(flipname, filename, len - 5);
    } else {
        flipname = (char *) calloc(len + 6, sizeof(char));
        assert(flipname != NULL);

        strcat(flipname, filename);
        strcat(flipname, ".flip");
    }

    source = fopen(filename, "rb");

    if (source == NULL) {
        printf("Cannot read file: %s\n", filename);
        return EXIT_FAILURE;
    }

    dest = fopen(flipname, "wb");

    if (dest == NULL) {
        if (fclose(source) == EOF) {
            printf("Failure closing source file.\n");
        }

        printf("Cannot write file: %s\n", flipname);
        return EXIT_FAILURE;
    }

    while ((b = fgetc(source)) != EOF) {
        if (fputc(~b, dest) == EOF) {
            printf("Error writing to file.\n");
            return EXIT_FAILURE;
        }
    }

    if (fclose(dest) == EOF) {
        printf("Error closing destination file.\n");
        return EXIT_FAILURE;
    }

    if (fclose(source) == EOF) {
        printf("Error closing source file.\n");
        return EXIT_FAILURE;
    }

    free(flipname);
    return EXIT_SUCCESS;
}
