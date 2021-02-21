# frozen_string_literal: true
require 'rest-client'
# rubocop:disable Style/Documentation

class StatesAPI
  def self.configure_type_request(type_request)
    @type_request = type_request
  end

  def self.request
    @type_request
  end

  def self.get_state(id)
    api_response = File.read("spec/fixtures/states/#{id}.json")

    JSON.parse(api_response)
  end

  def self.list_states
    if request == :api
      api_response = RestClient
      .get("https://servicodados.ibge.gov.br/api/v1/localidades/estados/")
    elsif request == :file
      api_response = File.read("spec/fixtures/states.json")
    end

    JSON.parse(api_response)
  end

  def self.list_names_state
    if request == :api
      api_response = RestClient
      .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#35")
    elsif request == :file
      api_response = File.read("spec/fixtures/states/rankings/ranking_names.json")
    end

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_female
    if request == :api
      api_response = RestClient
      .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?sexo=f")
    elsif request == :file
      api_response = File.read("spec/fixtures/states/rankings/state_female_names.json")
    end

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_male
    if request == :api
      api_response = RestClient
      .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?sexo=m")
    elsif request == :file
      api_response = File.read("spec/fixtures/states/rankings/state_male_names.json")
    end
    
    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end
end
