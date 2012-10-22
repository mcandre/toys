#!/bin/sh
exec scala "$0" "$@"
!#

object Hello {
	def main(args: Array[String]) {
		args.map(println)
	}
}