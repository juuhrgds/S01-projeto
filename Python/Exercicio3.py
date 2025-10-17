# Classe de composição
class ArmaCorpoACorpo:
    def __init__(self, nome: str):
        self.nome = nome

    def __str__(self):
        return f"Arma corpo a corpo: {self.nome}"


# Classe para adicionar os racker que entraram na organização
class PhantomThieves:
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} está com a arma {self.arma}"


# Classe principal chefe com sua arma
class Joker:
    def __init__(self, equipe: list[PhantomThieves]):
        # Composição: Joker cria e gerencia sua própria arma
        self.arma = ArmaCorpoACorpo("Faca")
        # Agregação: equipe passada como argumento
        self.equipe = equipe

    def mostrar_equipe(self):
        print(f"Joker está armado com uma {self.arma.nome}.")
        print("Equipe dos Phantom Thieves:")
        for membro in self.equipe:
            print(f"O/A {membro}")


# Programa principal
if __name__ == "__main__":
    # Criação dos membros da equipe
    m1 = PhantomThieves("Mariana", "Espada Curta")
    m2 = PhantomThieves("Samu", "Taco de Ferro")
    m3 = PhantomThieves("Ju", "Chicote")

    # O lider (Joker) adiciona seus membros
    equipe = [m1, m2, m3]
    joker = Joker(equipe)

    # Mostrar a equipe completa
    joker.mostrar_equipe()
