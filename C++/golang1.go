package main

import (
	"fmt"
)

func classificar_numero(num int) string {
	if num < 0 {
		return "Negativo"
	} else if num > 0 {
		return "Positivo"
	} else {
		return "Zero"
	}
}

func main() {
	var num int
	fmt.Print("Digite um valor positivo ou negativo ou nulo: ")
	fmt.Scan(&num)

	resul := classificar_numero(num)
	fmt.Println("O número é:", resul)
}
