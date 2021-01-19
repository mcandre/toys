// Package main provides an applecart executable, which demonstrates a Go pattern for potentially asynchronous iteration of arbitrary Go types, via the `range` interface.
package main

import "fmt"

// Apple is a placeholder for generally any Go type.
type Apple struct {
	Name string
}

// main is the entrypoint for this application.
func main() {
	apples := []Apple{
		{Name: "red"},
		{Name: "green"},
		{Name: "wormy"},
	}

	cart := make(chan Apple, len(apples))

	for _, apple := range apples {
		cart <- apple
	}

	close(cart)

	for apple := range cart {
		fmt.Println(apple.Name)
	}
}
