# Módulo Rastreador
module Rastreador
  def obter_localizacao(hora)
    "Localização de #{@nome} registrada às #{hora}: #{@localizacao}"
  end
end

# Módulo Perigoso
module Perigoso
  def calcular_risco
    # Aqui poderíamos ter uma lógica mais elaborada, mas vamos simplificar
    " Risco alto! #{@nome} representa uma ameaça iminente!"
  end
end

# Classe base Participante
class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome)
    @nome = nome
  end
end

# Classe Detetive
class Detetive < Participante
  include Rastreador

  def investigar
    puts " #{@nome} está analisando as pistas na área de #{@localizacao}."
  end
end

# Classe MestreDoCrime
class MestreDoCrime < Participante
  include Rastreador
  include Perigoso

  def planejar_crime
    puts " #{@nome} está tramando algo sombrio em #{@localizacao}..."
  end
end

# Classe Cenário
class Cenario
  def initialize
    @participantes = []
  end

  def adicionar_participante(p)
    @participantes << p
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end

  def listar_ameacas
    ameaças = identificar_ameacas
    if ameaças.empty?
      puts "Nenhuma ameaça detectada no cenário. Tudo tranquilo. "
    else
      puts "\n Ameaças identificadas:"
      ameaças.each do |a|
        puts "#{a.nome}: #{a.calcular_risco}"
      end
    end
  end
end

# --- MAIN ---
puts "\n️ --- Jogo das Sombras --- "
cenario = Cenario.new

# Criação das instâncias
puts "\nDigite a localização atual de Sherlock:"
loc_sherlock = gets.chomp
sherlock = Detetive.new("Sherlock Holmes")
sherlock.localizacao = loc_sherlock

puts "\nDigite a localização atual de Moriarty:"
loc_moriarty = gets.chomp
moriarty = MestreDoCrime.new("James Moriarty")
moriarty.localizacao = loc_moriarty

# Adiciona ao cenário
cenario.adicionar_participante(sherlock)
cenario.adicionar_participante(moriarty)

# Exibe localizações
puts "\n Localizações atuais:"
puts sherlock.obter_localizacao("10:15")
puts moriarty.obter_localizacao("10:16")

# Sherlock investiga e Moriarty age
sherlock.investigar
moriarty.planejar_crime

# Identifica ameaças
cenario.listar_ameacas
