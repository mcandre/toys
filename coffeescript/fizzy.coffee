#!/usr/bin/env coffee

fizzbuzz = (n) ->
  a = n % 3
  b = n % 5

  if a == 0 and b == 0
    "FizzBuzz"
  else if a == 0
    "Fizz"
  else if b == 0
    "Buzz"
  else
    n.toString()

main = () ->
  console.log (fizzbuzz n) for n in [1..100]

if not module.parent then main()
