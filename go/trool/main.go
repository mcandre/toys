// Package main provides a trool executable for demonstrating declaring Go types.
package main

import "fmt"

// Trool is like a boolean, but with one additional mode: Meh.
type Trool string

// Trool constants are declared in terms of string values: "TrieTrue", "TriFalse", and "TriMeh".
const (
	TriTrue  Trool = "TriTrue"
	TriFalse       = "TriFalse"
	TriMeh         = "TriMeh"
)

// main is the entrypoint for this application.
func main() {
	t1 := TriTrue
	t2 := TriFalse
	t3 := TriMeh

	fmt.Println(t1)
	fmt.Println(t2)
	fmt.Println(t3)
}
