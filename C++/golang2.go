package main

import (
	"fmt"
)

func main() {
	var num int
	fmt.Print("Digite um valor: ")
	fmt.Scan(&num)

	switch num % 2 {
	case 0:
		fmt.Println("é par")
	default:
		fmt.Println("é ímpar")
	}
}
