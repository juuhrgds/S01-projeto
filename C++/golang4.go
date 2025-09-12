package main

import (
	"fmt"
)

func verificarLogin(usuario, senha string) bool {
	if senha == "admin" && usuario == "senha"{
		return true
	}
	return false
}

func main() {
	for {
		var user, pass string

		fmt.Print("Nome de usuário: ")
		fmt.Scan(&user)

		fmt.Print("senha do acesso: ")
		fmt.Scan(&pass)

		if verificarLogin(user, pass) {
			fmt.Println("Login bem-sucedido!")
			break
		} else {
			fmt.Println("Usuário ou senha incorretos. Tente novamente.")
		}
	}
}
