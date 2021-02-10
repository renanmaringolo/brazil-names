require 'sqlite3'

class ApplicationRecord
  def self.all_states
    db = SQLite3::Database.open "db/database.db"
    db.results_as_hash = true
    states = db.execute "SELECT id, uf, state_name FROM states"
    db.close
    states.map {|state| new(id: state['id'], uf: state['uf'], state_name: state['state_name'])}
  end

  def save_state
    db = SQLite3::Database.open "db/database.db"
    db.execute "INSERT INTO states (uf, state_name) VALUES('#{uf}', '#{state_name}')"
    db.close
  end
end