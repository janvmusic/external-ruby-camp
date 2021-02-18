Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'airports', to: 'airports#search_airports' 
    end
  end
end
