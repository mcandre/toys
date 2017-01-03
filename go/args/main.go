// Package main provides an args executable demonstrating how to access command line arguments in Go.
package main

import (
	"fmt"
	"os"
)

// main is the entrypoint for this application.
func main() {
	for i, v := range os.Args {
		fmt.Println("i:", i, "v:", v)
	}
}
