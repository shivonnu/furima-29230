Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  resources :items do
    resources :messages, only: [:create]
    resources :purchases, only: [:new, :create]
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  root to: "items#index"

  mount ActionCable.server => '/cable'
  end
