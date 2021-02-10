class State < ApplicationRecord
  attr_reader :id, :uf, :state_name
  def initialize(id: nil, uf:, state_name:)
    @id = id
    @uf = uf
    @state_name = state_name
  end
end