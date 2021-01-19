// Package main provides a basic `uniq` executable in Go.
package main

import (
	"bufio"
	"fmt"
	"os"
)

// main is the entrypoint for this application.
func main() {
	uniqueLines := make(map[string]bool)

	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		uniqueLines[scanner.Text()] = true
	}

	for line := range uniqueLines {
		fmt.Println(line)
	}
}
