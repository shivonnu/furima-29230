Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :purchases
  end
    # collection do
    #   get 'done', to: 'purchases#done'
    #   post 'pay', to: 'purchases#pay'
    # end
  
  resources :shipping_addresses
  root to: "items#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
