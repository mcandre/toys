/**
 * @copyright 2020 YelloSoft
 *
 * @mainpage
 *
 * @ref hex_time renders a given time to hexadecimal.
 *
 * @ref hex_now renders the current time to hexadecimal.
 *
 * @ref main displays a hex clock.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define uint unsigned int

/**
 * @brief renders a given time to hexadecimal
 *
 * @param result answer buffer
 * @param n answer buffer length, including zero terminal
 * @param t a given time
 */
char *hex_time(char* result, size_t n, struct tm *t) {
    uint seconds = (unsigned int)(
        (t->tm_hour * 3600 + t->tm_min * 60 + t->tm_sec) * 65536.0 / 86400.0
    );

    uint hhour = seconds / 4096;
    uint hmin = (seconds % 4096) / 16;
    uint hsec = seconds % 16;

    (void) snprintf(result, n, "%x_%02x_%x", hhour, hmin, hsec);
    return result;
}

/**
 * @brief renders the current time in hexadecimal
 *
 * @param result answer buffer
 * @param n answer buffer length, including zero terminal
 */
char *hex_now(char *result, size_t n) {
    time_t timer = time(NULL);
    struct tm tbuf;
    struct tm *now = localtime_r(&timer, &tbuf);
    return hex_time(result, n, now);
}

/**
 * @brief CLI entrypoint for displaying a hex clock.
 */
int main() {
    char result[7];
    memset(result, 0, sizeof(result));
    printf("%s\n", hex_now(result, 7));
    return EXIT_SUCCESS;
}
