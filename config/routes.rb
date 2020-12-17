Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :purchases, only: [:new, :create]
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  root to: "items#index"
  end
