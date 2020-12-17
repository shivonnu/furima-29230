Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  resources :items do
    resources :purchases, only: [:index, :create]
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :items, only: :order do
    post 'order', on: :member
  end
 
  root to: "items#index"
  end
