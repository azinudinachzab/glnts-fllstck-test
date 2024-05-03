package main

import (
	"fmt"
	"strings"
)

func main() {
	removedChar := "a"
	str := "siapa aja ya"
	newStr := ""

	for _, val := range str {
		tmp := string(val)
		if strings.ToLower(tmp) == strings.ToLower(removedChar) {
			continue
		}
		newStr += tmp
	}
	fmt.Println(newStr)
}
