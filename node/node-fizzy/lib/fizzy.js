#!/usr/bin/env node

'use strict';

/**
 * @brief fizzBuzz plays a round of the famous drinking game.
 *
 * @param {number} n current game state
 *
 * @returns answer
 */
function fizzBuzz(n) {
    console.assert(Number.isInteger(n));

    var a = n % 3 === 0,
        b = n % 5 === 0;

    if (a && b) {
        return 'FizzBuzz';
    } else if (a) {
        return 'Fizz';
    } else if (b) {
        return 'Buzz';
    } else {
        return n.toString();
    }
}

exports.fizzBuzz = fizzBuzz;

function main() {
    for (var i = 1; i < 101; i++) {
        console.log(fizzBuzz(i));
    }
}

if (!module.parent) { main(); }
