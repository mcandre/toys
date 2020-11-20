/**
 * @copyright 2020 YelloSoft
 */

#include <stdio.h>
#include <string.h>

#include "hextime/hextime.h"

char *hex_now(char *result, size_t n) {
    time_t timer = time(NULL);
    struct tm tbuf;
    struct tm *now = localtime_r(&timer, &tbuf);
    return hex_time(result, n, now);
}

char *hex_time(char* result, size_t n, struct tm *t) {
    unsigned int seconds = (unsigned int)(
        (t->tm_hour * 3600 + t->tm_min * 60 + t->tm_sec) * 65536.0 / 86400.0
    );

    unsigned int hhour = seconds / 4096;
    unsigned int hmin = (seconds % 4096) / 16;
    unsigned int hsec = seconds % 16;

    (void) snprintf(result, n, "%x_%02x_%x", hhour, hmin, hsec);
    return result;
}
