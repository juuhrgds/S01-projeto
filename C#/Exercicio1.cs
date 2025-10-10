using System;

public class MembroDaSociedade
{
    
    private string nome;
    private string raca;
    private string funcao;
    
    public MembroDaSociedade(string nome, string raca, string funcao)
    {
        this.nome = nome;
        this.raca = raca;
        this.funcao = funcao;
    }
 
    public void Descrever()
    {
        Console.WriteLine($"Nme: {nome}, Raça: {raca}, Função: {funcao}");
    }
}
 
public class Program
{
    public static void Main(string[] args)
    {
        
        MembroDaSociedade aragorn = new MembroDaSociedade("Aragorn", "Humano", "Guardião");
        MembroDaSociedade legolas = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");
        
        aragorn.Descrever();
        legolas.Descrever();
    }
}
