package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		line := scanner.Text()
		lineChopped := line[:len(line)-1]
		fmt.Println(lineChopped)
	}
}
