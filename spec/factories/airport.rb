FactoryBot.define do
  factory :airport do
    name    { FFaker::Name.name }
    city    { FFaker::Address.city }
    country { FFaker::Address.country }
    iata    { FFaker::Lorem.characters(3) }
  end
end
