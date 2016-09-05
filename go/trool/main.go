package main

import "fmt"

type Trool string

const (
	TriTrue  Trool = "TriTrue"
	TriFalse       = "TriFalse"
	TriMeh         = "TriMeh"
)

func main() {
	t1 := TriTrue
	t2 := TriFalse
	t3 := TriMeh

	fmt.Println(t1)
	fmt.Println(t2)
	fmt.Println(t3)
}
