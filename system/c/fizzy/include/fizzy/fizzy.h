#pragma once

/**
 * @copyright 2020 YelloSoft
 * @mainpage
 *
 * @ref fizzy reports the appropriate answer given a game state.
 */

#include <stddef.h>

/**
 * @brief fizzy reports the appropriate answer given a game state.
 *
 * @param answer buffer max(9, 2 + log(n)) bytes
 * @param n game state.
 */
void fizzy(char *answer, unsigned int n);
