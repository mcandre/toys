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
 * @param answer buffer
 * @param t answer buffer length (byte count)
 * @param n game state
 *
 * @returns byte write count A value outside of [0, t] indicates error.
 */
int fizzy(char *answer, size_t t, int n);
