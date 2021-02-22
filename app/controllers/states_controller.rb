# frozen_string_literal: true

# rubocop:disable Style/Documentation

require 'rest-client'
require 'json'
require 'terminal-table'

class StatesController
  def self.show(id)
    api_response = StatesAPI.get_state(id)

    api_response['id']
  end

  def self.index
    api_response = StatesAPI.list_states

    linhas = []

    api_response.each do |result|
      nome = result.to_a[0].last
      code_state = result.to_a[1].last
      temp = [nome, code_state]
      linhas << temp
    end
    Terminal::Table.new title: 'Estados', headings: ['Código do Estado', 'Nome'], rows: linhas
  end

  def self.ranking_general_state(acronym)
    api_response = StatesAPI.list_names_state(acronym)

    linhas = []

    api_response.each do |result|
      nome = result.to_a[0].last
      frequencia = result.to_a[1].last
      rank = result.to_a[2].last
      temp = [nome, frequencia, rank]
      linhas << temp
    end
    Terminal::Table.new title: 'Ranking por Estado', headings: %w[Nome Frequência Ranking], rows: linhas
  end

  def self.state_by_female(acronym)
    api_response = StatesAPI.by_female(acronym)

    linhas = []

    api_response.each do |result|
      nome = result.to_a[0].last
      frequencia = result.to_a[1].last
      rank = result.to_a[2].last
      temp = [nome, frequencia, rank]
      linhas << temp
    end
    Terminal::Table.new title: 'Ranking por Sexo Feminino/Estado', headings: %w[Nome Frequência Ranking],
                        rows: linhas
  end

  def self.state_by_male(acronym)
    api_response = StatesAPI.by_male(acronym)

    linhas = []

    api_response.each do |result|
      nome = result.to_a[0].last
      frequencia = result.to_a[1].last
      rank = result.to_a[2].last
      temp = [nome, frequencia, rank]
      linhas << temp
    end
    Terminal::Table.new title: 'Ranking por Sexo Masculino/Estado', headings: %w[Nome Frequência Ranking],
                        rows: linhas
  end
end
