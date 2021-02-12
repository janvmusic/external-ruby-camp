Rails.application.routes.draw do
  post 'airport', to: 'airport#search_airports' 
end
