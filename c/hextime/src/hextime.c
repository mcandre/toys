/**
 * @copyright 2020 YelloSoft
 */

#include <stdio.h>
#include <string.h>

#include "hextime/hextime.h"

char *hex_now(char *result, size_t n) {
    time_t timer = time(NULL);
    struct tm tbuf;
    struct tm *now = gmtime_r(&timer, &tbuf);
    return hex_time(result, n, now);
}

char *hex_time(char* result, size_t n, struct tm *t) {
    int hhour = t->tm_hour * 16 / 24;
    int hmin = t->tm_min * 256 / 60;
    (void) snprintf(result, n, "%x_%02x", hhour, hmin);
    return result;
}
