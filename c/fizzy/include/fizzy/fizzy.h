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
 * @param answer_size buffer size (bytes)
 * @param n game state
 *
 * @returns byte write count. A value outside of [0, answer_size] indicates error.
 */
int fizzy(char *answer, size_t answer_size, int n);
