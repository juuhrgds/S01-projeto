from abc import ABC, abstractmethod
from typing import List

# Criar a ação de hackear algo
class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self) -> None:
        """Executa a ação de hack do objeto cibernético."""
        pass

# Criar o que os hacker tem a habilidade de fazer
class Implante:
    def __init__(self, custo: float, funcao: str):
        self.custo = custo
        self.funcao = funcao

    def __str__(self):
        return f"Implante(funcao='{self.funcao}', custo={self.custo})"

# Criando os rackers que seus respectivos implantes
class NetRunner(Cibernetico):
    def __init__(self, nome: str, implante: Implante):
        self.nome = nome
        # Composição: NetRunner(hacker) possui e gerencia seu próprio Implante
        self.implante = implante

    # executando um hack( no caso a ação de cada hacker)
    def realizar_hack(self) -> None:
        # Implementação específica do NetRunner
        print(f"{self.nome} está realizando um hack usando {self.implante.funcao} "
              f"(custo {self.implante.custo}).")

    def __str__(self):
        return f"NetRunner {self.nome} com {self.implante}"

# Organização que tem os hacker como equipe e paga para eles fazerem as coisas
class Faccao:
    def __init__(self, membros: List[Cibernetico] | None = None):
        # Agregação: a facção recebe referências aos cibernéticos
        self.membros: List[Cibernetico] = membros if membros is not None else []

    def adicionar_membro(self, membro: Cibernetico) -> None:
        self.membros.append(membro)

    def executar_hacks(self) -> None:
        print("Faccao ordena: executar hacks!")
        for membro in self.membros:
            membro.realizar_hack()

    def __str__(self):
        return f"Faccao com {len(self.membros)} membros"

# Ex
if __name__ == "__main__":
    # Criando os hacker com seu implates com as funções
    implante_a = Implante(1500.0, "Invasão de CFTV")
    implante_b = Implante(2300.5, "Bypass de segurança bancária")
    implante_c = Implante(900.0, "Desativação de drones")

    nr1 = NetRunner("Admin", implante_a)
    nr2 = NetRunner("Caixa", implante_b)
    nr3 = NetRunner("Alok", implante_c)

    # Criando a facção (agregação) e adicionando NetRunners(hackers)
    faccao = Faccao()
    faccao.adicionar_membro(nr1)
    faccao.adicionar_membro(nr2)
    faccao.adicionar_membro(nr3)

    print(faccao)
    # Ordena que todos executem seus hacks
    faccao.executar_hacks()
