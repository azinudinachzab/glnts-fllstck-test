package main

import (
	"fmt"
	"strings"
	"unicode"
)

func main() {
	fmt.Println(IsPalindrome("top, Spot"))
}

func IsPalindrome(txt string) bool {
	txt = strings.ToLower(txt)

	newTxt := ""
	for _, val := range txt {
		if !unicode.IsLetter(val) && !unicode.IsNumber(val) {
			continue
		}
		newTxt += string(val)
	}

	reversedTxt := ""
	for i := len(txt) - 1; i >= 0; i-- {
		if !unicode.IsLetter(rune(txt[i])) && !unicode.IsNumber(rune(txt[i])) {
			continue
		}
		reversedTxt += string(txt[i])
	}

	for i := 0; i < len(newTxt); i++ {
		if newTxt[i] != reversedTxt[i] {
			return false
		}
	}
	return true
}
