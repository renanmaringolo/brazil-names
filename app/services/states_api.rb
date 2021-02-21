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

  def self.get_acronym(acronym)
    uri = URI('https://servicodados.ibge.gov.br/api/v1/localidades/estados')
    response = RestClient.get(uri.to_s)
    states_hash = JSON.parse(response.body)
    state = states_hash.find { |state| state['sigla'] == acronym }
  end

  def self.get_state(id)
    case request
    when :api
      state = get_acronym(acronym)
      api_response = RestClient
                     .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#{state['id']}")
    when :file
      api_response = File.read("spec/fixtures/states/#{id}.json")
    end

    JSON.parse(api_response)
  end

  def self.list_states
    case request
    when :api
      api_response = RestClient
                     .get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/')
    when :file
      api_response = File.read('spec/fixtures/states.json')
    end

    JSON.parse(api_response)
  end

  def self.list_names_state(acronym)
    case request
    when :api
      state = get_acronym(acronym)
      api_response = RestClient
                     .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#{state['id']}")
    when :file
      api_response = File.read('spec/fixtures/states/rankings/ranking_names.json')
    end

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_female(acronym)
    case request
    when :api
      state = get_acronym(acronym)
      api_response = RestClient
                     .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#{state['id']}&sexo=f")
    when :file
      api_response = File.read('spec/fixtures/states/rankings/state_female_names.json')
    end

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_male(acronym)
    case request
    when :api
      state = get_acronym(acronym)
      api_response = RestClient
                     .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#{state['id']}&sexo=m")
    when :file
      api_response = File.read('spec/fixtures/states/rankings/state_male_names.json')
    end

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end
end
