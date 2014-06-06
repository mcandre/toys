#!/usr/bin/env scala

object Fizzy {
  def fizzy: Unit = {
    (1 to 100).par.map { n =>
      (n % 3, n % 5) match {
        case (0, 0) => "FizzBuzz"
        case (0, _) => "Fizz"
        case (_, 0) => "Buzz"
        case (_, _) => n.toString
      }
    }.map(println)
  }

  def main(args: Array[String]): Unit = {
    fizzy
  }
}
