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
 * @param result buffer
 * @param result_size buffer size (bytes)
 *
 * @returns bytes written. A value outside of [0, result_size] indicates error.
 */
int hex_now(char *result, size_t result_size);

/**
 * @brief renders a given time to hexadecimal
 *
 * @param result buffer
 * @param result_size buffer size (bytes)
 * @param t UTC
 *
 * @returns bytes written. A value outside of [0, result_size] indicates error.
 */
int hex_time(char* result, size_t result_size, struct tm *t);
