// Package main provides a ddg executable for launching DuckDuckGo queries in the operating system's default browser.
package main

import (
	"log"
	"os"
	"strings"

	"github.com/skratchdot/open-golang/open"
)

// DuckDuckGo REST API details.
const (
	DuckDuckGo = "https://duckduckgo.com/?q=!"
	Sep        = "%20"
)

// main is the entrypoint for this application.
func main() {
	err := open.Run(DuckDuckGo + strings.Join(os.Args[1:], Sep))

	if err != nil {
		log.Panic(err)
	}
}
