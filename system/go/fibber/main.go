// Package main provides a fibber executable for demonstrating a basic Fibonacci implementation in Go.
package main

import (
	"fmt"
	"os"
	"strconv"
)

// usage prints the command line interface for this application.
func usage() {
	fmt.Println("fibber <n>")
	os.Exit(0)
}

// fib calculates the Fibonacci function for a given non-negative integer.
func fib(n uint) uint {
	switch n {
	case 0, 1:
		return n
	default:
		return fib(n-1) + fib(n-2)
	}
}

// main is the entrypoint for this application.
func main() {
	if len(os.Args) < 2 {
		usage()
	} else {
		n, err := strconv.ParseUint(os.Args[1], 10, 0)

		if err != nil {
			usage()
		}

		fmt.Println(fib(uint(n)))
	}
}
