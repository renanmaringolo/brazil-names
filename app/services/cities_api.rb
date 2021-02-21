# frozen_string_literal: true

# rubocop:disable Style/Documentation

class CitiesAPI
  def self.configure_type_request(type_request)
    @type_request = type_request
  end

  def self.request
    @type_request
  end

  def self.get_city(id)
    api_response = File.read("spec/fixtures/cities/#{id}.json")

    JSON.parse(api_response)
  end

  def self.list_cities
    if request == :api
      api_response = RestClient
      .get("https://servicodados.ibge.gov.br/api/v1/localidades/municipios")
    elsif request == :file
      api_response = File.read('spec/fixtures/cities.json')
    end

    JSON.parse(api_response)
  end

  def self.list_names_city
    api_response = RestClient
    .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=1100023")

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_female
    api_response = RestClient
    .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=1100023&sexo=f")

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_male
    api_response = RestClient
    .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=1100023&sexo=m")

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end
end
