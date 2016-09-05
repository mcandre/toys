package main

import (
	"github.com/skratchdot/open-golang/open"
	"os"
	"strings"
)

const (
	DuckDuckGo = "https://duckduckgo.com/?q=!"
	Sep        = "%20"
)

func main() {
	open.Run(DuckDuckGo + strings.Join(os.Args[1:], Sep))
}
