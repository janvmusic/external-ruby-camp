class AddUniqueIndexToAirpors < ActiveRecord::Migration[6.1]
  def change
    add_index :airports, [:name, :iata, :city, :country], unique: true
  end
end
