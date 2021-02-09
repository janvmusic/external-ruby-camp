class Airport < ApplicationRecord
  validates :name, uniqueness: { scope: %i[city country iata], message: 'A Iata code must be unique for the airport' }
end
