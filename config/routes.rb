Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :items do
    resources :messages, only: [:new, :create]
    resources :purchases, only: [:new, :create]
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  root to: "items#index"

  end
