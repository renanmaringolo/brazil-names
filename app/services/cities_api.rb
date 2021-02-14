class CitiesAPI
  def self.get_city(id)
    api_response = File.read("spec/fixtures/cities/#{id}.json")
    
    JSON.parse(api_response)
  end

  def self.list_cities
    api_response = File.read("spec/fixtures/cities.json")

    JSON.parse(api_response)
  end

  def self.list_names_city
    api_response = File.read("spec/fixtures/cities/rankings/ranking_names.json")
    
    ranking = JSON.parse(api_response).first.to_a
    
    ranking.last.last
  end

  def self.by_female
    api_response = File.read("spec/fixtures/cities/rankings/city_female_names.json")

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_male
    api_response = File.read("spec/fixtures/cities/rankings/city_male_names.json")

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end
end