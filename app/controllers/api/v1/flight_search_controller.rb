require 'http'

class Api::V1::FlightSearchController < ApplicationController
  def search_one_way_itinerary
    response = HTTP.get(
      "https://api.flightapi.io/onewaytrip/#{api_key}/#{from}/#{to}/#{start_date}/2/0/1/#{class_type}/#{currency}"
    )

    if response.status == 200
      puts 'Fetching itineraries'
      puts 'MAZAPAN got here'
    else
      puts 'Unable to fetch itineraries.'
      json_response([])
    end
  end

  def search_round_trip_itinerary
    key = ENV['FLIGHT_API_KEY']

    response = HTTP.get(
      "https://api.flightapi.io/onewaytrip/#{key}/#{from}/#{to}/#{start_date}/2/0/1/#{class_type}/#{currency}",
    )

    if response.status == 200
      # do something
    else
      # do something else
    end
  end

  private
  def itinerary_params
    permited_parameters = %i[from to start_date class_type currency]
    params.require(:itinerary).permit(permited_parameters)
  end

  def api_key
    ENV['FLIGHT_API_KEY']
  end

  def from
    itinerary_params['from']
  end

  def to
    itinerary_params['to']
  end

  def start_date
    itinerary_params['start_date'] || Date.today + 10
  end

  def class_type
    itinerary_params['class_type'] || 'economy'
  end

  def currency
    itinerary_params['currency'] || 'USD'
  end
end
