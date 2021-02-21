class Api::V1::AirportsController < ApplicationController
  def search_airports
    if airport_params.size > 2
      @airports = Airport.where('iata ILIKE ?',    "%#{params[:search]}%").limit(5)
      @airports = Airport.where('city ILIKE ?',    "%#{params[:search]}%").limit(5) unless @airports.size.positive?
      @airports = Airport.where('country ILIKE ?', "%#{params[:search]}%").limit(5) unless @airports.size.positive?
      @airports = Airport.where('name ILIKE ?',    "%#{params[:search]}%").limit(5) unless @airports.size.positive?

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
