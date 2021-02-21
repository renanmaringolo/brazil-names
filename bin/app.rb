#!/usr/bin/env ruby


PROJECT_ROOT = File.expand_path('..', __dir__)

Dir[File.join(PROJECT_ROOT, 'app', 'services', '*.rb')].each { |f| require f }
Dir[File.join(PROJECT_ROOT, 'app', 'controllers', '*.rb')].each { |f| require f }

CitiesAPI.configure_type_request(:api)
StatesAPI.configure_type_request(:api)

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

print 'Escolha uma opção: '
opcao = gets.to_i

case opcao
when 1
  states = StatesController.new
  puts states.index
when 2
  ranking_by_state = StatesController.new
  puts ranking_by_state.ranking_general_state
when 3
  rank_by_fem_state = StatesController.new
  puts rank_by_fem_state.state_by_female
when 4
  rank_by_masc_state = StatesController.new
  puts rank_by_masc_state.state_by_male
when 5
  cities = CitiesController.new
  puts cities.index
when 6
  ranking_by_city = CitiesController.new
  puts ranking_by_city.ranking_general_city
when 7
  rank_by_fem_city = CitiesController.new
  puts rank_by_fem_city.city_by_female
when 8
  rank_by_masc_city = CitiesController.new
  puts rank_by_masc_city.city_by_male
end
