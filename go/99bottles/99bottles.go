package main

import "fmt"

func main() {
	for i := 99; i > 1; i-- {
		fmt.Printf("%d bottles of beer on the wall, %d bottles of beer!\nTake one down, pass it around,\n%d bottles of beer on the wall!\n", i, i, i-1)
	}

	fmt.Printf("1 bottle of beer on the wall, 1 bottle of beer!\nTake one down, pass it around, 99 bottles of beer on the wall!\n")
}
