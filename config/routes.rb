Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#welcome', as: 'home'

  resources :products
  resources :users
  resources :sales_orders
  resources :sales_orders_products, only: [:create, :update, :destroy]

  get 'login', to: 'sessions#new'
  post 'logout', to: 'sessions#logout'
  post 'login', to: 'sessions#create'

end
