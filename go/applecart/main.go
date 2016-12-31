package main

import "fmt"

type Apple struct {
	Name string
}

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
