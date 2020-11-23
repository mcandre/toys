#pragma once

/**
 * @copyright 2020 YelloSoft
 * @mainpage
 *
 * @ref hex_now renders the current time to hexadecimal.
 *
 * @ref hex_time renders a given time to hexadecimal.
 */

#include <time.h>

/**
 * @brief renders the current time in hexadecimal
 *
 * @param result buffer (6 bytes)
 *
 * @returns zero. -1 indicates error.
 */
int hex_now(char *result);

/**
 * @brief renders a given time to hexadecimal
 *
 * @param result buffer (6 bytes)
 * @param t UTC
 *
 * @returns zero. -1 indicates error.
 */
int hex_time(char* result, struct tm *t);
