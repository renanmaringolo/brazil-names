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
    case request
    when :api
      api_response = RestClient
                     .get('https://servicodados.ibge.gov.br/api/v1/localidades/municipios')
    when :file
      api_response = File.read('spec/fixtures/cities.json')
    end

    JSON.parse(api_response)
  end

  def self.list_names_city
    case request
    when :api
      api_response = RestClient
                     .get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=1100023')
    when :file
      api_response = File.read('spec/fixtures/cities/rankings/ranking_names.json')
    end

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_female
    case request
    when :api
      api_response = RestClient
                     .get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=1100023&sexo=f')
    when :file
      api_response = File.read('spec/fixtures/cities/rankings/city_female_names.json')
    end

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_male
    case request
    when :api
      api_response = RestClient
                     .get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=1100023&sexo=m')
    when :file
      api_response = File.read('spec/fixtures/cities/rankings/city_male_names.json')
    end

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end
end
