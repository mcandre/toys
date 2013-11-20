#!/bin/bash

div3() {
  echo $((($1 % 3) == 0))
}

div5() {
  echo $((($1 % 5) == 0))
}

fizzy() {
  if [ "$(div3 "$1")" -eq 1 ] && [ "$(div5 "$1")" -eq 1 ]; then
    echo "FizzBuzz"
  elif [ "$(div3 "$1")" -eq 1 ]; then
    echo "Fizz"
  elif [ "$(div5 "$1")" -eq 1 ]; then
    echo "Buzz"
  else
    echo "$1"
  fi
}

for ((i = 1; i < 101; i++))
do
  fizzy $i
done
