# frozen_string_literal: true

class HomeController
  def self.menu
    puts '==== Nomes Brasil ===='
    puts '## Menu ##'
    puts '1 - Listar Estados'
    puts '2 - Ranking por Estado'
    puts '3 - Ranking por Gênero Feminino/Estado'
    puts '4 - Ranking por Gênero Masculino/Estado'
    puts '5 - Listar Cidades'
    puts '6 - Ranking por Cidade'
    puts '7 - Ranking por Gênero Feminino/Cidade'
    puts '8 - Ranking por Gênero Masculino/Cidade'
    puts '0 - Sair'

    print 'Escolha uma opção: '
    opcao = gets.to_i

    case opcao
    when 1
      puts StatesController.index
    when 2
      print 'Digite a UF a ser consultada (SP, RJ, BA...): '
      acronym = gets.strip.upcase

      puts StatesController.ranking_general_state(acronym)
    when 3
      print 'Digite a UF a ser consultada (SP, RJ, BA...): '
      acronym = gets.strip.upcase

      puts StatesController.state_by_female(acronym)
    when 4
      print 'Digite a UF a ser consultada (SP, RJ, BA...): '
      acronym = gets.strip.upcase

      puts StatesController.state_by_male(acronym)
    when 5
      puts CitiesController.index
    when 6
      print 'Digite a Cidade a ser consultada (São Paulo, Salvador...): '
      name = gets.strip

      puts CitiesController.ranking_general_city(name)
    when 7
      print 'Digite a Cidade a ser consultada (São Paulo, Salvador...): '
      name = gets.strip

      puts CitiesController.city_by_female(name)
    when 8
      print 'Digite a Cidade a ser consultada (São Paulo, Salvador...): '
      name = gets.strip

      puts CitiesController.city_by_male(name)
    when 0
      puts see_you
      exit
    end
  end

  def self.not_consult?
    puts 'Deseja consultar novamente? S/N'
    wish_consult = gets.strip
    wish_consult.upcase == 'N'
  end

  def self.see_you
    puts
    puts '             OOOOOOOOOOO               '
    puts '         OOOOOOOOOOOOOOOOOOO           '
    puts '      OOOOOO  OOOOOOOOO  OOOOOO        '
    puts '    OOOOOO      OOOOO      OOOOOO      '
    puts '  OOOOOOOO  #   OOOOO  #   OOOOOOOO    '
    puts ' OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   '
    puts 'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  '
    puts 'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  '
    puts 'OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  '
    puts ' OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   '
    puts '  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    '
    puts '    OOOOO   OOOOOOOOOOOOOOO   OOOO     '
    puts '      OOOOOO   OOOOOOOOO   OOOOOO      '
    puts '         OOOOOO         OOOOOO         '
    puts '             OOOOOOOOOOOO              '
    puts
    puts '               Até Logo!                '
    puts
  end
end
