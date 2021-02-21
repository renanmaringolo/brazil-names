# frozen_string_literal: true
require 'rest-client'
# rubocop:disable Style/Documentation

class StatesAPI
  def self.get_state(id)
    api_response = File.read("spec/fixtures/states/#{id}.json")

    JSON.parse(api_response)
  end

  def self.list_states
    api_response = RestClient
    .get("https://servicodados.ibge.gov.br/api/v1/localidades/estados/")

    JSON.parse(api_response)
  end

  def self.list_names_state
    api_response = RestClient
    .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#35")

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_female
    api_response = RestClient
    .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?sexo=f")

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_male
    api_response = RestClient
    .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?sexo=m")

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end
end
