package main

import (
	"fmt"
	"os"
	"strconv"
)

func usage() {
	fmt.Println("fibber <n>")
	os.Exit(0)
}

func fib(n uint) uint {
	switch n {
	case 0, 1:
		return n
	default:
		return fib(n-1) + fib(n-2)
	}
}

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
