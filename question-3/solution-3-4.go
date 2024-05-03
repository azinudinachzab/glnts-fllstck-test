package main

import (
	"fmt"
	"math"
)

func findSecondHighest(arr []int) string {
	if len(arr) < 2 {
		return "Array should have at least two elements"
	}

	firstMax := math.MinInt64
	secondMax := math.MinInt64

	for _, num := range arr {
		if num > firstMax {
			secondMax = firstMax
			firstMax = num
		} else if num > secondMax && num != firstMax {
			secondMax = num
		}
	}

	if secondMax == math.MinInt64 {
		return "Second highest number does not exist in the array"
	}

	return fmt.Sprintf("%v", secondMax)
}

func main() {
	arr := []int{3, 3, 5, 7, 9, 10}
	fmt.Println("Second highest number:", findSecondHighest(arr))
}
