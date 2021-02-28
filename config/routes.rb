Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Get
      get 'airports',  to: 'airports#search_airports' 
      
      # Post
      post 'itinerary', to: 'flight_search#search_one_way_itinerary' 
    end
  end
end
