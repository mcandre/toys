// Package main provides a freq executable demonstrating statistical data for line text input.
package main

import (
	"bufio"
	"fmt"
	"os"
)

// main is the entrypoint for this application.
func main() {
	frequencies := make(map[string]int)

	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		frequencies[scanner.Text()]++
	}

	for line, frequency := range frequencies {
		fmt.Println(frequency, line)
	}
}
