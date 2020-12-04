/**
 * @copyright 2020 YelloSoft
 */

#include <stdio.h>
#include <string.h>

#include "hextime/hextime.h"

void hex_now(char *result) {
    time_t timer = time(NULL);
    struct tm tbuf;
    struct tm *now = gmtime_r(&timer, &tbuf);
    hex_time(result, now);
}

void hex_time(char* result, struct tm *t) {
    double beats = (
        t->tm_hour * 3600 +
        t->tm_min * 60 +
        t->tm_sec
    ) * 4096.0 / 86400.0;

    int hhour = (int) beats / 256;
    int hmin = (int) (beats - hhour * 256) / 16;
    int hsec = (int) beats - hhour * 256 - hmin * 16;

    size_t sz = 6;

    (void) snprintf(
        result,
        sz,
        "%x_%x_%x",
        hhour,
        hmin,
        hsec
    );
}
