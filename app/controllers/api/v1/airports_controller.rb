class Api::V1::AirportsController < ApplicationController
  def search_airports
    if airport_params.size > 2
      @airports = Airport.where('lower(iata)    = ?', params[:search].downcase)
      @airports = Airport.where('lower(city)    = ?', params[:search].downcase) unless @airports.size.positive?
      @airports = Airport.where('lower(country) = ?', params[:search].downcase) unless @airports.size.positive?
      @airports = Airport.where('lower(name)    = ?', params[:search].downcase) unless @airports.size.positive?

      json_response(@airports)
    else
      json_response([])
    end
  end

  private
  def airport_params
    params.require(:search)
  end
end
