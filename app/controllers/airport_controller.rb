class AirportController < ApplicationController
  def search_airports
    # Iata
    # Name
    # City
    # Country
    # Limit 10

    if params[:search].length > 2
      @airports = Airport.where(iata:    params[:search])
      @airports = Airport.where(name:    params[:search]) unless @airports.size.positive
      @airports = Airport.where(city:    params[:search]) unless @airports.size.positive
      @airports = Airport.where(country: params[:search]) unless @airports.size.positive

      render json: @airports.to_json
    else
      render json: []
    end
  end

  private
  def airport_params
    params.require(:search).permit(:search)
  end
end
