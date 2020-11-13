Rails.application.routes.draw do
  get 'homes/index'
  resources :totals
  resources :payments
  resources :bags
  resources :pickups
  resources :landlords
  resources :receipts
  resources :fruits
  resources :orders
  resources :clients
  resources :employees
  devise_for :users
  # root to: 'pages#home'
  root to: 'homes#index'

  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #     resources :employees
  #   end
  # end

  mount Api => '/'

end
