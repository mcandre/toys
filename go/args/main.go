package main

import (
	"fmt"
	"os"
)

func main() {
	for i, v := range os.Args {
		fmt.Printf("i: %d v: %s\n", i, v)
	}
}
