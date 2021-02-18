require 'rails_helper'

RSpec.describe Api::V1::AirportsController, type: :api do
  let!(:cuu_airport) { create(:airport, iata: 'CUU', city: 'Chihuahua', name: 'Chihuahua Airport', country: 'Mexico') }
  let!(:cun_airport) { create(:airport, iata: 'CUN', city: 'Chihuahua', name: 'Cancun Airport',    country: 'Mexico') }
  let!(:jfk_airport) { create(:airport, iata: 'JFK', city: 'New York',  name: 'John F. Keneddy',   country: 'USA') }
  let!(:lga_airport) { create(:airport, iata: 'JFK', city: 'New York',  name: 'La Guardia',        country: 'USA') }

  context 'GET airports' do
    it 'search by iata' do
      get '/api/v1/airports?search=CUU'

      expect(response_status_code).to eq(200)
      expect(response_body.count).to  eq(1)

      expect(response_body.first['name']).to    eq(cuu_airport.name)
      expect(response_body.first['iata']).to    eq(cuu_airport.iata)
      expect(response_body.first['city']).to    eq(cuu_airport.city)
      expect(response_body.first['country']).to eq(cuu_airport.country)
    end

    it 'search by iata with case insensitive' do
      get '/api/v1/airports?search=cuu'

      expect(response_status_code).to eq(200)
      expect(response_body.count).to eq(1)

      expect(response_body.first['name']).to    eq(cuu_airport.name)
      expect(response_body.first['iata']).to    eq(cuu_airport.iata)
      expect(response_body.first['city']).to    eq(cuu_airport.city)
      expect(response_body.first['country']).to eq(cuu_airport.country)
    end

    it 'search by city' do
      get '/api/v1/airports?search=New York'

      expect(response_status_code).to eq(200)
      expect(response_body.count).to  eq(2)

      expect(response_body.first['name']).to    eq(jfk_airport.name)
      expect(response_body.first['iata']).to    eq(jfk_airport.iata)
      expect(response_body.first['city']).to    eq(jfk_airport.city)
      expect(response_body.first['country']).to eq(jfk_airport.country)
    end

    it 'search by name case insensitive' do
      get '/api/v1/airports?search=New York'

      expect(response_status_code).to eq(200)
      expect(response_body.count).to  eq(2)

      expect(response_body.first['name']).to    eq(jfk_airport.name)
      expect(response_body.first['iata']).to    eq(jfk_airport.iata)
      expect(response_body.first['city']).to    eq(jfk_airport.city)
      expect(response_body.first['country']).to eq(jfk_airport.country)
    end

    it 'search by country' do
      get '/api/v1/airports?search=Mexico'

      expect(response_status_code).to eq(200)
      expect(response_body.count).to  eq(2)
    end

    it 'search by country case insensitive' do
      get '/api/v1/airports?search=mexico'

      expect(response_status_code).to eq(200)
      expect(response_body.count).to  eq(2)
    end

    it 'search by name' do
      get '/api/v1/airports?search=La Guardia'

      expect(response_status_code).to eq(200)
      expect(response_body.count).to  eq(1)

      expect(response_body.first['name']).to    eq(lga_airport.name)
      expect(response_body.first['iata']).to    eq(lga_airport.iata)
      expect(response_body.first['city']).to    eq(lga_airport.city)
      expect(response_body.first['country']).to eq(lga_airport.country)
    end
  end

  context 'GET airport with invalid params' do
    # it 'search without 3 letters' do
    #   raise 'Implement test'
    # end

    # it 'search without params' do
    #   raise 'Implement test'
    # end
  end
end
