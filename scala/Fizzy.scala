#!/usr/bin/env scala

object Fizzy {
  def fizzy: Seq[String] = (1 to 100).par.map { n =>
    (n % 3, n % 5) match {
      case (0, 0) => "FizzBuzz"
      case (0, _) => "Fizz"
      case (_, 0) => "Buzz"
      case (_, _) => n.toString
    }
  }.seq

  def main(args: Array[String]): Unit = fizzy.foreach(println)
}
