class StatesAPI
  def self.get_state(id)
    api_response = File.read("spec/fixtures/states/#{id}.json")
    
    JSON.parse(api_response)
  end

  def self.list_states
    api_response = File.read("spec/fixtures/states.json")

    JSON.parse(api_response)
  end
end
