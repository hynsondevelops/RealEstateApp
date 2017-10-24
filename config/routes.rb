Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { registrations: "registrations" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :states
  resources :cities
  resources :zipcodes
  resources :galleries
  resources :followings
  resources :pictures
  resources :listings, :except => [:create]
  post '/listings/create', to: 'listings#create'
  post '/listings', to: 'listings#search'
  get '/search_filter', to: 'listings#search_filter'
  post '/simpleSearch', to: 'listings#simpleSearch'
  get '/users/listed', to: 'users#listed', as: 'users_listed'
  root to: "listings#index"
  get '/buy', to: "listings#buy"
  get '/rent', to: "listings#rent"
  get "/home", to: "listings#home"

end
