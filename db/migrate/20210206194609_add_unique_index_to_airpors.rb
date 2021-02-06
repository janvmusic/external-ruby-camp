class AddUniqueIndexToAirpors < ActiveRecord::Migration[6.1]
  def change
    add_index :airports, [:name, :iata, :city], unique: true
  end
end
