class StatesAPI
  def self.get_state(id)
    api_response = File.read("spec/fixtures/states/#{id}.json")
    
    JSON.parse(api_response)
  end

  def self.list_states
    api_response = File.read("spec/fixtures/states.json")

    JSON.parse(api_response)
  end

  def self.list_names_state
    api_response = File.read("spec/fixtures/states/rankings/ranking_names.json")
    
    ranking = JSON.parse(api_response).first.to_a
    
    ranking.last.last
  end

  def self.by_female
    api_response = File.read("spec/fixtures/states/rankings/state_female_names.json")

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end

  def self.by_male
    api_response = File.read("spec/fixtures/states/rankings/state_male_names.json")

    ranking = JSON.parse(api_response).first.to_a

    ranking.last.last
  end
end
