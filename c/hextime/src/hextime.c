/**
 * @copyright 2020 YelloSoft
 */

#include <stdio.h>
#include <string.h>

#include "hextime/hextime.h"

int hex_now(char *result, size_t result_size) {
    time_t timer = time(NULL);
    struct tm tbuf;
    struct tm *now = gmtime_r(&timer, &tbuf);
    return hex_time(result, result_size, now);
}

int hex_time(char* result, size_t result_size, struct tm *t) {
    if (result_size < 6) {
        return -1;
    }

    double beats = (
        t->tm_hour * 3600 +
        t->tm_min * 60 +
        t->tm_sec
    ) * 4096.0 / 86400.0;

    int hhour = (int) beats / 256;
    int hmin = (int) (beats - hhour * 256) / 16;
    int hsec = (int) beats - hhour * 256 - hmin * 16;

    return snprintf(
        result,
        result_size,
        "%x_%x_%x",
        hhour,
        hmin,
        hsec
    );
}
