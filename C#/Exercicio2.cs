using System;
using System.Collections.Generic;

public class Pokemon{

    public string Nome { get; set; }

    public virtual void Atacar(){

        Console.WriteLine($"{Nome} usou um ataque genérico!");

    }

}

public class PokemonDeFogo : Pokemon{

    public override void Atacar(){

        Console.WriteLine($"{Nome} lança um jato de fogo!");

    }

}
 
public class PokemonDeAgua : Pokemon{

    public override void Atacar(){

        Console.WriteLine($"{Nome} lança um jato de água!");

    }

}
 
public class Program{

    public static void Main(string[] args){

        List<Pokemon> pokemons = new List<Pokemon>();

        PokemonDeFogo charizard = new PokemonDeFogo { Nome = "Charizard" };
        PokemonDeAgua blastoise = new PokemonDeAgua { Nome = "Blastoise" };
 
        pokemons.Add(charizard);
        pokemons.Add(blastoise);

        foreach (var pokemon in pokemons){

            pokemon.Atacar();

        }

    }

}
 
