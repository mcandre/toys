package main

import "fmt"
import "os"

func main() {
	for i, v := range os.Args {
		fmt.Printf("i: %d v: %s\n", i, v)
	}
}
