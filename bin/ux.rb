# frozen_string_literal: true

def menu
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
    states = StatesController.new
    puts states.index
  when 2
    print 'Digite a UF a ser consultada (SP, RJ...): '
    acronym = gets.strip.upcase
    ranking_general_state = StatesController.new
    puts ranking_general_state.ranking_general_state(acronym)
  when 3
    print 'Digite a UF a ser consultada (SP, RJ...): '
    acronym = gets.strip.upcase
    rank_by_fem_state = StatesController.new
    puts rank_by_fem_state.state_by_female(acronym)
  when 4
    print 'Digite a UF a ser consultada (SP, RJ...): '
    acronym = gets.strip.upcase
    rank_by_masc_state = StatesController.new
    puts rank_by_masc_state.state_by_male(acronym)
  when 5
    cities = CitiesController.new
    puts cities.index
  when 6
    print 'Digite a UF a ser consultada (Rio de Janeiro, Salvador...): '
    name = gets.strip.upcase.to_s
    ranking_by_city = CitiesController.new
    puts ranking_by_city.ranking_general_city(name)
  when 7
    print 'Digite a UF a ser consultada (Rio de Janeiro, Salvador...): '
    name = gets.strip.upcase.to_s
    rank_by_fem_city = CitiesController.new
    puts rank_by_fem_city.city_by_female(name)
  when 8
    print 'Digite a UF a ser consultada (Rio de Janeiro, Salvador...): '
    name = gets.strip.upcase.to_s
    rank_by_masc_city = CitiesController.new
    puts rank_by_masc_city.city_by_male(name)
  end
end

def not_consult?
  puts 'Deseja consultar novamente? S/N'
  wish_consult = gets.strip
  wish_consult.upcase == 'N'
end

def see_you
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
