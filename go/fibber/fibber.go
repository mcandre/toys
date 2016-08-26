package main

import (
	"fmt"
	"os"
	"strconv"
)

func usage() {
	fmt.Println("fibber <n>")
}

func fib(n int) int {
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
		n, err := strconv.Atoi(os.Args[1])

		if err != nil {
			usage()
		} else {
			fmt.Println(fib(n))
		}
	}
}
