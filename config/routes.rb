Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'edit_addresses', to: 'users/registrations#edit_address'
    patch 'edit_addresses', to: 'users/registrations#update_address'
  end
  resources :items do
    get 'tags', to: 'items#new_tags'
    post 'tags', to: 'items#create_tags'
    get 'search', to: 'items#search'
    resources :messages, only: [:new, :create]
    resources :purchases, only: [:new, :create]
  end
  resources :users, only: [:show, :update, :edit]
  resources :cards, only: [:new, :create]
  root to: "items#index"
  get 'items_item_search', to: 'items#item_search'

  end
