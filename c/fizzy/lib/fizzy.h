#pragma once

/**
 * @copyright 2020 YelloSoft
 *
 * @mainpage
 *
 * @ref fizzy reports the appropriate answer given a game state.
 *
 * @ref main plays a game of FizzBuzz.
 */

#include <stddef.h>

/**
 * @brief fizzy reports the appropriate answer given a game state.
 *
 * @param s answer buffer
 * @param t answer buffer length, in characters
 * @param n game state
 */
void fizzy(char* s, size_t t, int i);
