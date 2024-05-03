package main

import "fmt"

func firstNonRepeatedChar(str string) string {
	charCount := make(map[rune]int)

	for _, char := range str {
		charCount[char]++
	}

	for _, char := range str {
		if charCount[char] == 1 {
			return string(char)
		}
	}

	return ""
}

func main() {
	input := "leetcode"
	result := firstNonRepeatedChar(input)
	if result != "" {
		fmt.Printf("The first non-repeated character in '%s' is: %s\n", input, result)
	} else {
		fmt.Println("No non-repeated character found in the string.")
	}
}
