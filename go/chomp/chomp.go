package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

const LineEndingCharacters = "\r\n"

func chomp(s string) string {
	return strings.TrimRight(s, LineEndingCharacters)
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		line := scanner.Text()
		fmt.Println(chomp(line))
	}
}
