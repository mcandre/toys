// Package main provides a fizzy executable for demonstrating a FizzBuzz implementation.
package main

import "fmt"

// fizzy calculates the proper FizzBuzz vs. Fizz vs. Buzz mapping for a given integer.
func fizzy(i int) string {
	a, b := i%3 == 0, i%5 == 0

	switch {
	case a && b:
		return "FizzBuzz"
	case a:
		return "Fizz"
	case b:
		return "Buzz"
	default:
		return fmt.Sprintf("%d", i)
	}
}

// main is the entrypoint for this application.
func main() {
	for i := 1; i < 101; i++ {
		fmt.Println(fizzy(i))
	}
}
