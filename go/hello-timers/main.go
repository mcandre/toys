// Package main provides a hello executable demonstrating a Go Hello World implementation.
package main

import (
	"fmt"
	"time"
)

// Pluck is an example callback to be fired on a timer.
func Pluck() {
	fmt.Println("Chime-")
}

// main is the entrypoint for this application.
func main() {
	pollInterval := 100

	timerCh := time.Tick(time.Duration(pollInterval) * time.Millisecond)

	for range timerCh {
		Pluck()
	}
}
