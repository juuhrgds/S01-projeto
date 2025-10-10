using System;
using System.Collections.Generic;
 
public class Feitico{
    public string Nome { get; set; }
    public string Efeito { get; set; }
}

public class Ferramenta{
    public string Nome { get; set; }
}

public class Grimorio{
    
    private List<Feitico> feiticos = new List<Feitico>();
 
    public void AdicionarFeitico(Feitico feitico){
        feiticos.Add(feitico);
        Console.WriteLine($"Feitiço '{feitico.Nome}' adicionado ao grimório.");
    }
}

public class Maga{
    
    public string Nome { get; }
    
    public Grimorio Grimorio { get; } = new Grimorio();
    
    public List<Ferramenta> Ferramentas { get; }
 
    public Maga(string nome, List<Ferramenta> ferramentas){
        Nome = nome;
        Ferramentas = ferramentas;
    }
}
 
public class Program{
    
    public static void Main(string[] args){
        
        List<Ferramenta> ferramentasIniciais = new List<Ferramenta>
        {
            new Ferramenta { Nome = "Pederneira" },
            new Ferramenta { Nome = "Faca" },
            new Ferramenta { Nome = "Lanterna" }
        };
        
        Maga frieren = new Maga("Frieren", ferramentasIniciais);
        
        frieren.Grimorio.AdicionarFeitico(new Feitico { Nome = "Bola de Fogo", Efeito = "Causa dano de fogo." });
        frieren.Grimorio.AdicionarFeitico(new Feitico { Nome = "Cura Leve", Efeito = "Restaura pontos de vida." });
        
        Console.WriteLine($"\nFerramentas de {frieren.Nome}:");

        foreach (var ferramenta in frieren.Ferramentas){
            Console.WriteLine($"- {ferramenta.Nome}");
        }
    }
}
