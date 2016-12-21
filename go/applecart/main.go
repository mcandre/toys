package main

import "fmt"

type Apple struct {
	Name string
}

func main() {
	cart := make(chan Apple)
	apples := []Apple{
		{Name: "red"},
		{Name: "green"},
		{Name: "wormy"},
	}

	go func() {
		for _, apple := range apples {
			cart <- apple
		}

		close(cart)
	}()

	for apple := range cart {
		fmt.Println(apple.Name)
	}
}
