Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :listings, :except => [:create]
  post '/listings/create', to: 'listings#create'
  post '/listings', to: 'listings#search'
end
