// Package main provides a magic executable that leaks HD DVD keys.
package main

import (
	"fmt"
	"strings"
)

// data is the reverse engineered HD DVD key.
var data = [...]byte{0x09, 0xf9, 0x11, 0x02, 0x9d, 0x74, 0xe3, 0x5b, 0xd8, 0x41, 0x56, 0xc5, 0x63, 0x56, 0x88, 0xbd}

// main is the entrypoint for this application.
func main() {
	var data2 [16]byte
	var pieces [16]string

	for i := 0; i < 6; i++ {
		if i != 3 {
			copy(data2[:], data[:])
			data2[15] += byte(i)

			for k, v := range data2 {
				pieces[k] = fmt.Sprintf("%02x", v)
			}

			fmt.Println(strings.Join(pieces[:], " "))
		} else {
			fmt.Println(strings.Repeat(" ", 17) + "[ redacted ]")
		}
	}
}
