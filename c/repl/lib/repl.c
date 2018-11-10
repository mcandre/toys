// Copyright 2009-2014 YelloSoft

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define PROGRAM "REPL"

#define VERSION "1.0.0"

#define COPYRIGHT "Copyright 2009 YelloSoft"

#define WELCOME "Use \'exit\' or Control-C to quit."

#define PROMPT "> "

#define EXIT "exit"

static void __attribute__((noreturn)) usage(char *const program) {
    printf("Usage: %s <script>\n", program);
    printf("\n-h --help\tDisplay usage\n");
    printf("-v --version\tDisplay version\n");
}

static void __attribute__((noreturn)) version() {
    printf("%s %s\n", PROGRAM, VERSION);
}

static void welcome() {
    printf("%s %s - %s\n", PROGRAM, VERSION, COPYRIGHT);
    printf("%s\n", WELCOME);
}

static void interactive() {
    char *command;

    welcome();

    command = (char *) malloc(1024);

    if (command != NULL) {
        do {
            printf(PROMPT);
            (void) scanf("%1023s", command);
        } while (strcmp(command, EXIT) != 0);
    }

    free(command);
}

static int run(char *const script) {
    FILE *f = fopen(script, "rb");

    if (f == NULL) {
        printf("Error: Cannot read script %s\n", script);
        return -1;
    } else {
        int c = fgetc(f);

        while (c != EOF) {
            (void) putchar(c);
            c = fgetc(f);
        }

        (void) fclose(f);
        return 0;
    }
}

int main(int const argc, char **const argv) {
    if (argc < 2) {
        if (interactive() == 0) {
            return EXIT_SUCCESS;
        } else {
            return EXIT_FAILURE;
        }
    } else {
        int i;

        for (i = 1; i < argc; i++) {
            if (strcmp(argv[i], "-h") == 0 || strcmp(argv[i], "--help") == 0) {
                usage(argv[0]);
                return EXIT_SUCCESS;
            } else if (strcmp(argv[i], "-v") == 0 || strcmp(argv[i], "--version") == 0) {
                version();
                return EXIT_SUCCESS;
            }
        }

        run(argv[1]);
        return EXIT_SUCCESS;
    }
}
