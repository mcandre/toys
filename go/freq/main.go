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
		fmt.Println(frequency, line)
	}
}
