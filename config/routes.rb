Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'edit_addresses', to: 'users/registrations#edit_address'
    patch 'edit_addresses', to: 'users/registrations#update_address'
  end
  resources :items do
    resources :messages, only: [:new, :create]
    resources :purchases, only: [:new, :create]
  end
  resources :users, only: [:show, :update, :edit]
  resources :cards, only: [:new, :create]
  root to: "items#index"

  end
