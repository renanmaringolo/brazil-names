class CitiesAPI
  def self.get_city(id)
    api_response = File.read("spec/fixtures/cities/#{id}.json")
    
    JSON.parse(api_response)
  end

  def self.list_cities
    api_response = File.read("spec/fixtures/cities.json")

    JSON.parse(api_response)
  end
end