# Classe MicroondasUnidade (Composição)
class MicroondasUnidade
  def aquecer_por(segundos)
    puts "🔸 Aquecendo por #{segundos} segundos..."
  end
end

# Classe DMail (Agregação)
class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "D-Mail: '#{@conteudo}' enviado às #{@hora_envio}"
  end
end

# Classe TelefoneDeMicroondas
class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new   # composição → o telefone possui um micro-ondas
    @dmail_lista = []                  # agregação → guarda vários D-Mails
  end

  def enviar_dmail
    puts "\nDigite o conteúdo do D-Mail:"
    conteudo = gets.chomp

    puts "Digite a hora de envio (ex: 10:30):"
    hora_envio = gets.chomp

    puts "Por quantos segundos deseja aquecer?"
    segundos = gets.chomp.to_i

    @unidade.aquecer_por(segundos)

    novo_dmail = DMail.new(conteudo, hora_envio)
    @dmail_lista << novo_dmail

    puts "✅ D-Mail enviado com sucesso!"
  end

  def listar_dmails(horario_corte)
    puts "\n🔹 Listando D-Mails enviados após #{horario_corte}:"
    dmails_filtrados = @dmail_lista.select { |d| d.hora_envio > horario_corte }

    if dmails_filtrados.empty?
      puts "Nenhum D-Mail após esse horário."
    else
      dmails_filtrados.each { |d| puts d }
    end
  end
end

# --- MAIN ---
telefone = TelefoneDeMicroondas.new

loop do
  puts "\n=== MENU DO TELEFONE DE MICROONDAS ==="
  puts "1. Enviar D-Mail"
  puts "2. Listar D-Mails após um horário"
  puts "3. Sair"
  print "Escolha: "
  opcao = gets.chomp.to_i

  case opcao
  when 1
    telefone.enviar_dmail
  when 2
    puts "Digite o horário de corte (ex: 09:00):"
    corte = gets.chomp
    telefone.listar_dmails(corte)
  when 3
    puts "Encerrando o programa."
    break
  else
    puts "Opção inválida!"
  end
end
