package main

import "fmt"

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

func main() {
	for i := 1; i < 101; i++ {
		fmt.Println(fizzy(i))
	}
}
