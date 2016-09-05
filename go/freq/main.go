package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	frequencies := make(map[string]int)

	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		frequencies[scanner.Text()]++
	}

	for line, frequency := range frequencies {
		fmt.Printf("%d\t%s\n", frequency, line)
	}
}
