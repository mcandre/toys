#!/usr/bin/env node

'use strict';

/**
 * fizzBuzz plays a round of the famous drinking game.
 *
 * @param {number} n current game state
 *
 * @returns answer
 */
function fizzBuzz(n) {
    console.assert(Number.isInteger(n));

    const a = n % 3 === 0,
        b = n % 5 === 0;

    if (a && b) {
        return 'FizzBuzz';
    } else if (a) {
        return 'Fizz';
    } else if (b) {
        return 'Buzz';
    }

    return n.toString();
}

exports.fizzBuzz = fizzBuzz;

function main() {
    for (let i = 1; i < 101; i++) {
        console.log(fizzBuzz(i));
    }
}

if (!module.parent) { main(); }
