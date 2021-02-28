require 'rails_helper'

RSpec.describe Api::V1::FlightSearchController, type: :api do
  api_url = "https://api.flightapi.io/onewaytrip/#{ENV['FLIGHT_API_KEY']}/LHR/LAX/#{Date.current + 10.days}/2/0/1/economy/USD"

  context 'POST search' do
    it 'economy one way trip' do
      stub_request(:get, api_url)

      itinerary_search = {
        from: 'LHR',
        to: 'LAX',
        start_date: Date.current + 10.days,
        class_type: 'economy',
        currency: 'USD'
      }

      post '/api/v1/itinerary', itinerary: itinerary_search
      expect(response_status_code).to eq(200)
    end

    # it 'business one way trip' do
    #   raise 'Implement this test'
    # end

    # it 'different currency one way trip' do
    #   raise 'Implement this test'
    # end
  end

  context 'POST search with invalid params' do
    # it 'Past date' do
    #   raise 'Implement this test'
    # end

    # it 'Invalid airport' do
    #   raise 'Implement this test'
    # end

    # it 'Invalid key' do
    #   raise 'Implement this test'
    # end

    # it 'Key expired' do
    #   raise 'Implement this test'
    # end
  end
end
