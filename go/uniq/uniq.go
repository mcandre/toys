package main

import (
	"bufio"
	"fmt"
	"os"
)

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
