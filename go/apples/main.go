package main

import "fmt"

func main() {
	basket := make(chan string)

	go func() {
		for _, a := range []string{"red", "green", "wormy"} {
			basket <- a
		}

		close(basket)
	}()

	for apple := range basket {
		fmt.Println(apple)
	}
}
