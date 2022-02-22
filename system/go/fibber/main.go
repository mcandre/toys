// Package main provides a fibber executable for demonstrating a basic Fibonacci implementation in Go.
package main

import (
	"fmt"
	"log"
	"os"
	"strconv"
)

// usage prints the command line interface for this application.
func usage() {
	fmt.Println("fibber <n>")
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
	if len(os.Args) == 0 {
		log.Fatalf("error: missing program name\n")
	}

	if len(os.Args) < 2 {
		usage()
		os.Exit(1)
	}

	n, err := strconv.ParseUint(os.Args[1], 10, 0)

	if err != nil {
		usage()
		os.Exit(1)
	}

	fmt.Println(fib(uint(n)))
}
