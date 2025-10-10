using System;

public abstract class MonstroSombrio{
    
    public string Nome { get; set; }
    
    public abstract void Mover();
}

public class Zumbi : MonstroSombrio{
    
    public override void Mover(){
        
        Console.WriteLine($"{Nome} se arrasta lentamente...");
        
    }
}
 
public class Espectro : MonstroSombrio{
    
    public override void Mover(){
        
        Console.WriteLine($"{Nome} flutua rapidamente pelas paredes!");
        
    }
}
 
public class Program{
    
    public static void Main(string[] args){
        
        MonstroSombrio[] horda = new MonstroSombrio[]{
            
            new Zumbi { Nome = "Zumbi Pútrido" },
            new Espectro { Nome = "Espectro Vingativo" },
            new Zumbi { Nome = "Zumbi Andarilho" }
            
            
        };
        
        Console.WriteLine("A horda se aproxima!");
        
        foreach (var monstro in horda){
            
            monstro.Mover();
        }
    }
}
