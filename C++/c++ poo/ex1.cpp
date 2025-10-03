#include <iostream>
#include <string>
using namespace std;
 
class Personagem {
public:
    string n;
    int ni;
    int d;
    int v;
 
    Personagem(string n, int nv, int d, int v) {
        n = n;
        ni = nv;
        d = d;
        v = v;
    }
 
    void atacar(Personagem &inimigo) {
        cout << nome << " bateu " << inimigo.nome << " e deu " 
<< dano << " de dano!" << endl;
        inimigo.vida -= dano;
        if (inimigo.vida < 0) inimigo.vida = 0;
    }
 
    void mostrarInfo() {
        cout << "Nome: " << nome 
<< " Nivel: " << nivel 
<< " Dano: " << dano 
<< " Vida: " << vida << endl;
    }
};
 
int main() {
    Personagem p1("Aragorn", 5, 20, 100);
    Personagem p2("Goblin", 2, 10, 60);
    // simulando um combate
 
    cout << "-----pre-combate" << endl;
    p1.mostrarInfo();
    p2.mostrarInfo();
 
    cout << "\ncombate" << endl;
    p1.atacar(p2);
    p2.atacar(p1);
 
    cout << "\npos combate" << endl;
    p1.mostrarInfo();
    p2.mostrarInfo();
 
    return 0;
}
