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

#include <time.h>

/**
 * @brief renders the current time in hexadecimal
 *
 * @param result answer buffer
 * @param n answer buffer length, including zero terminal
 */
char *hex_now(char *result, size_t n);

/**
 * @brief renders a given time to hexadecimal
 *
 * @param result answer buffer
 * @param n answer buffer length, including zero terminal
 * @param t a given time
 */
char *hex_time(char* result, size_t n, struct tm *t);
