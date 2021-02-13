class StatesAPI
  def self.configure_driver(driver_type)
    @driver_type = driver_type
  end

  def self.driver
    @driver_type
  end

  def self.get_state(id)
    if driver == :http_api
      api_response =
        RestClient
        .get("https://servicodados.ibge.gov.br/api/v1/localidades/estados/#{id}")
        .body
    elsif driver == :file
      api_response = File.read("spec/fixtures/states/#{id}.json")
    end
    
    JSON.parse(api_response)
  end

  def self.list_states
    if driver == :http_api
      api_response =
        RestClient
        .get("https://servicodados.ibge.gov.br/api/v1/localidades/estados/")
        .body
    elsif driver == :file
      api_response = File.read("spec/fixtures/states.json")
    end

    JSON.parse(api_response)
  end
end
