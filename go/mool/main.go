package main

import "fmt"

type Mool struct{}

func (m Mool) String() string {
	return "Mool"
}

func main() {
	var m Mool

	fmt.Println(m)
}
