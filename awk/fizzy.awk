#!/usr/bin/awk -f

function fizzy(n) {
  x = n % 3;
  y = n % 5;

  if (x == 0 && y == 0) {
    return "FizzBuzz";
  }
  else if (x == 0) {
    return "Fizz";
  }
  else if (y == 0) {
    return "Buzz";
  }
  else {
    return n;
  }
}

BEGIN {
  for (i = 1; i < 101; i++) {
    print fizzy(i);
  }
}
