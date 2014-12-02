package us.yellosoft.fizzy.groovy

final def fizzy = { final n ->
  if (n % 15 == 0) {
    "FizzBuzz"
  }
  else if (n % 3 == 0) {
    "Fizz"
  }
  else if (n % 5 == 0) {
    "Buzz"
  }
  else {
    n.toString()
  }
}

(1 .. 100).collect(fizzy).each { s -> println s }
