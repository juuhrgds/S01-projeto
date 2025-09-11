#include <iostream>
using namespace std;

int main() {
    int quantidade;
    float nota, soma = 0;

    cout << "Quantas notas deseja inserir? ";
    cin >> quantidade;

    for (int i = 0; i < quantidade; i++) {
        cout << "Digite a nota " << i + 1 << ": ";
        cin >> nota;

        while (nota < 0 || nota > 10){
            cout << "Nota invalida! Digite novamente (0 a 10): ";
            cin >> nota;
        }

        soma += nota;
    }

    float media = soma / quantidade;

    cout << "\nMedia final = " << media << endl;

    if (media >= 7) {
        cout << "Situacao: Aprovado" << endl;
    } else {
        cout << "Situacao: Reprovado" << endl;
    }

    return 0;
}
