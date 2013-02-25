#!/usr/bin/env scala

object Fizzy {
	def fizzy {
		(1 to 100).map { n =>
			val x, y = (n % 3, n % 5)

			(x, y) match {
				case (0, 0) => "FizzBuzz"
				case (0, _) => "Fizz"
				case (_, 0) => "Buzz"
				case _ => n.toString
			}
		}.map(println)
	}

	def main(args: Array[String]) {
		fizzy
	}
}
