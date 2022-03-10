#pragma once

/**
 * @copyright 2020 YelloSoft
 * @mainpage
 *
 * @ref fizzy controls a drinking game.
 */

#include <string>

/**
 * @brief fizzy controls a drinking game.
 */
namespace fizzy {
/**
 * @brief Fizzy reports the appropriate answer given a game state.
 *
 * @param n game state
 * @returns answer
 */
std::string Fizzy(unsigned int n);
}
