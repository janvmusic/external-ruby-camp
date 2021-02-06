class Airport < ApplicationRecord
  validates :name, uniqueness: { scope: %i[iata city], message: 'A Iata code must be unique for the airport' }

end
