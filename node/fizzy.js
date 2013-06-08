#!/usr/bin/env node

function fizzBuzz(n) {
  var
  a = n % 3 == 0,
  b = n % 5 == 0;

  if (a && b) {
    return "FizzBuzz";
  }
  else if (a) {
    return "Fizz";
  }
  else if (b) {
    return "Buzz";
  }
  else {
    return n.toString();
  }
}

function main() {
  for (var i = 1; i < 101; i++) {
    console.log(fizzBuzz);
  }
}

if (!module.parent) { main(); }
