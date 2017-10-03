Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :galleries
  resources :followings
  resources :pictures
  resources :listings, :except => [:create]
  post '/listings/create', to: 'listings#create'
  post '/listings', to: 'listings#search'
  root to: "listings#index"
end
