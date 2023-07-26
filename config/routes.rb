Rails.application.routes.draw do

  root 'homes#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  resources :suggestions
  resources :local_authorities
  resources :broadcasts
  resources :events
  resources :businesses
  resources :business_products
  resources :orders
  
  resources :rooms do
    resources :messages
  end
end
