/**
 * @copyright 2020 YelloSoft
 */

#include <stdio.h>
#include <string.h>

#include "hextime/hextime.h"

int hex_now(char *result) {
    time_t timer = time(NULL);
    struct tm tbuf;
    struct tm *now = gmtime_r(&timer, &tbuf);
    return hex_time(result, now);
}

int hex_time(char* result, struct tm *t) {
    double beats = (
        t->tm_hour * 3600 +
        t->tm_min * 60 +
        t->tm_sec
    ) * 4096.0 / 86400.0;

    int hhour = (int) beats / 256;
    int hmin = (int) (beats - hhour * 256) / 16;
    int hsec = (int) beats - hhour * 256 - hmin * 16;

    size_t len = 6;

    int bytes_written = snprintf(
        result,
        len,
        "%x_%x_%x",
        hhour,
        hmin,
        hsec
    );

    if (bytes_written < 0 || bytes_written > (int) len) {
        return -1;
    }

    return 0;
}
