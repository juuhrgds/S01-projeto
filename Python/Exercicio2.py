from abc import ABC, abstractmethod

# Classe base
class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass


# Classe filha: para personagens que são tanques
class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} (Tanque) ativou sua super barreira!")

# Classe filha: para personagens que dão dano
class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} (Dano) Lançou um grandioso ataque!")

# Definindo os personagens
if __name__ == "__main__":
    herois = [
        Tanque("D.VA"),
        Dano("Bastion"),
        Tanque("Ramattra"),
        Dano("Trace")
    ]

    #for para mostrar todos os personagens ultados
    for heroi in herois:
        heroi.usar_ultimate()
