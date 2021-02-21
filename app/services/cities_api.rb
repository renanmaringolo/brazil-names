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
    if request == :api
      api_response = RestClient
      .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=1100023")
    elsif request == :file
      api_response = File.read("spec/fixtures/cities/rankings/ranking_names.json")
    end

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_female
    if request == :api
      api_response = RestClient
      .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=1100023&sexo=f")
    elsif request == :file
      api_response = File.read("spec/fixtures/cities/rankings/city_female_names.json")
    end

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_male
    if request == :api
      api_response = RestClient
      .get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=1100023&sexo=m")
    elsif request == :file
      api_response = File.read("spec/fixtures/cities/rankings/city_male_names.json")
    end
    
    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end
end
