require 'sqlite3'

class State
  attr_reader :id, :uf, :state_name

  def initialize(id: nil, uf:, state_name:)
    @id = id
    @uf = uf
    @state_name = state_name
  end

  def self.all
    db = SQLite3::Database.open "db/database.db"
    db.results_as_hash = true
    states = db.execute "SELECT id, uf, state_name FROM states"
    db.close
    states.map {|state| new(id: state['id'], uf: state['uf'], state_name: state['state_name'])}
  end

  def save_to_db
    db = SQLite3::Database.open "db/database.db"
    db.execute "INSERT INTO states (uf, state_name) VALUES('#{uf}', '#{state_name}')"
    db.close
    self
  end
end