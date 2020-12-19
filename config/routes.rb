Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  resources :items do
    resources :messages, only: [:create]
    resources :purchases, only: [:new, :create]
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  mount ActionCable.server => '/cable'
  root to: "items#index"
  end
