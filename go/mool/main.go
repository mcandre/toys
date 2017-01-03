// Package main provides a mool executable demonstrating declaring Go types.
package main

import "fmt"

// Mool is like a boolean, but with only one possible value: Mool.
type Mool struct{}

// String implements the String() contract, so that a Mool can be easily rendered as a string value.
func (m Mool) String() string {
	return "Mool"
}

// main is the entrypoint for this application.
func main() {
	var m Mool

	fmt.Println(m)
}
