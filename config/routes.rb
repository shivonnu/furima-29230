Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  resources :items do
    resources :purchases, only: [:index, :create]
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  root to: "items#index"
  end
