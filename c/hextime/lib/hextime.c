// Copyright 2008-2014 YelloSoft

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define uint unsigned int

static /*@null@*/ char *hex_time(char* result) {
    time_t timer = time(NULL);
    struct tm tbuf;
    struct tm *local = localtime_r(&timer, &tbuf);

    uint seconds = (unsigned int)(
        (local->tm_hour * 3600 + local->tm_min * 60 + local->tm_sec) * 65536.0 / 86400.0
    );

    uint hhour = seconds / 4096;
    uint hmin = (seconds % 4096) / 16;
    uint hsec = seconds % 16;

    (void) snprintf(result, sizeof(result)-1, "%x_%02x_%x", hhour, hmin, hsec);
    return result;
}

int main() {
    char result[7];
    memset(result, 0, sizeof(result));
    printf("%s\n", hex_time(result));
    return EXIT_SUCCESS;
}
