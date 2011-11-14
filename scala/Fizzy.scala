#!/usr/bin/env sh
exec scala "$0" "$@"
!#

object Fizzy {
	def fizzy() {
		(1 to 100).map { i =>
			if (i % 15 == 0)
				"FizzBuzz"
			else if (i % 3 == 0)
				"Fizz"
			else if (i % 5 == 0)
				"Buzz"
			else
				i.toString()
		}.map(println)
	}

	def main(args: Array[String]) {
		fizzy()
	}
}