Rails.application.routes.draw do
  devise_for :users
  resources :items 
  resources :shipping_addresses
  resources :purchases
  root to: "items#index"
  get 'phrchases', to: 'phrchases#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
