package main

import (
	"strings"
	"fmt"
)

var data = []byte{0x09, 0xf9, 0x11, 0x02, 0x9d, 0x74, 0xe3, 0x5b, 0xd8, 0x41, 0x56, 0xc5, 0x63, 0x56, 0x88, 0xbd}

func main() {
	var data2  []byte
	var pieces []string

	for i := 0; i < 6; i++ {
		if i != 3 {
			copy(data2, data)
			data2[len(data2)-1] += byte(i)
			for i, e := range data2 {
				pieces[i] = fmt.Sprintf("%02x", e)
			}

			fmt.Println(strings.Join(pieces[:], " "))
		} else {
			fmt.Println(strings.Repeat(" ", 17) + "[ redacted ]")
		}
	}
}
