# frozen_string_literal: true

# rubocop:disable Style/Documentation

require 'rest-client'
require 'json'
require 'terminal-table'
require_relative './application_controller'

class StatesController < ApplicationController
  def show
    api_response = StatesAPI.get_state(params[:id])

    api_response['sigla']
  end

  def index
    api_response = StatesAPI.list_states

    linhas = []

    api_response.each do |result|
      nome = result.to_a[0].last
      code_state = result.to_a[1].last
      temp = [nome, code_state]
      linhas << temp
    end
    Terminal::Table.new title: 'Estados', headings: ['Nome', 'Código Estado'], rows: linhas
  end

  def ranking_general_state
    api_response = StatesAPI.list_names_state

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

  def state_by_female
    api_response = StatesAPI.by_female

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

  def state_by_male
    api_response = StatesAPI.by_male

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
