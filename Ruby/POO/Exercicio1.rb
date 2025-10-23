# Classe base Drink
class Drink
  attr_reader :nome

  #iniciar uma váriavel(drink)
  def initialize(nome, preco_base)
    @nome = nome
    self.preco_base = preco_base
  end

  #iniciar uma variavel com o preço
  def preco_base
    @preco_base
  end

  #validar e inserir o valor do preço
  def preco_base=(valor)
    if valor > 0
      @preco_base = valor
    else
      raise "O preço deve ser positivo!"
    end
  end

  #inicializar o preço final do drink
  def preco_final
    @preco_base
  end

  def to_s
    "Drink: #{@nome} | Preço base: $#{@preco_base}"
  end
end

# Subclasse DrinkLenda
class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  #Valor substituido para o  drink lenda
  def preco_final
    @preco_base + (5 * @anos_desde_criacao)
  end

  def to_s
    "Drink Lenda: #{@nome} | Preço base: $#{@preco_base} | " \
    "Anos desde criação: #{@anos_desde_criacao} | Preço final: $#{preco_final}"
  end
end

# --- MAIN ---
puts "Digite o nome do drink:"
nome = gets.chomp

puts "Digite o preço base do drink:"
preco_base = gets.chomp.to_f

puts "Digite os anos desde a criação do drink:"
anos = gets.chomp.to_i

drink = DrinkLenda.new(nome, preco_base, anos)

puts "\n#{drink}"
