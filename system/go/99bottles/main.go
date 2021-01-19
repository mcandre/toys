// Package main provides a 99bottles executable.
package main

import "fmt"

// main is the entrypoint for this application.
func main() {
	for i := 99; i > 1; i-- {
		fmt.Printf("%d bottles of beer on the wall,\n%d bottles of beer!\nTake one down, pass it around,\n%d bottles of beer on the wall!\n", i, i, i-1)
	}

	fmt.Println("1 bottle of beer on the wall,\n1 bottle of beer!\nTake one down, pass it around,\n99 bottles of beer on the wall!")
}
