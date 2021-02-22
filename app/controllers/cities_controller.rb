# frozen_string_literal: true

# rubocop:disable Style/Documentation

require 'rest-client'
require 'json'

class CitiesController
  def self.show(id)
    api_response = CitiesAPI.get_city(id)

    api_response.first['id']
  end

  def self.index
    api_response = CitiesAPI.list_cities

    linhas = []

    api_response.each do |result|
      nome = result.to_a[0].last
      code_city = result.to_a[1].last
      temp = [nome, code_city]
      linhas << temp
    end
    Terminal::Table.new title: 'Cidades', headings: ['Código da Cidade', 'Nome'], rows: linhas
  end

  def self.ranking_general_city(name)
    api_response = CitiesAPI.list_names_city(name)

    linhas = []

    api_response.each do |result|
      nome = result.to_a[0].last
      frequencia = result.to_a[1].last
      rank = result.to_a[2].last
      temp = [nome, frequencia, rank]
      linhas << temp
    end
    Terminal::Table.new title: 'Ranking por Cidade', headings: %w[Nome Frequência Ranking], rows: linhas
  end

  def self.city_by_female(name)
    api_response = CitiesAPI.by_female(name)

    linhas = []

    api_response.each do |result|
      nome = result.to_a[0].last
      frequencia = result.to_a[1].last
      rank = result.to_a[2].last
      temp = [nome, frequencia, rank]
      linhas << temp
    end
    Terminal::Table.new title: 'Ranking por Sexo Feminino/Cidade', headings: %w[Nome Frequência Ranking],
                        rows: linhas
  end

  def self.city_by_male(name)
    api_response = CitiesAPI.by_male(name)

    linhas = []

    api_response.each do |result|
      nome = result.to_a[0].last
      frequencia = result.to_a[1].last
      rank = result.to_a[2].last
      temp = [nome, frequencia, rank]
      linhas << temp
    end
    Terminal::Table.new title: 'Ranking por Sexo Masculino/Cidade', headings: %w[Nome Frequência Ranking],
                        rows: linhas
  end
end
