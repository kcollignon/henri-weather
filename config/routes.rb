Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'weather#index'

  get '/weather/search' => 'weather#search'
  resources :saved_locations, only: [:create, :destroy]
end
