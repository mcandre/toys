package main

import (
  "fmt"
  "bufio"
  "os"
)

func main() {
  uniqueLines := make(map[string]bool)

  scanner := bufio.NewScanner(os.Stdin)

  for scanner.Scan() {
    uniqueLines[scanner.Text()] = true
}

for line, _ := range uniqueLines {
  fmt.Println(line)
}
}
