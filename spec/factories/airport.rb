FactoryBot.define do
  factory :airport do
    name    { FFaker::Name.name }
    city    { FFaker::Address.city }
    country { FFaker::Address.country }
    iata    { 'CUU' }
  end
end
