Rails.application.routes.draw do
 
  root 'homes#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  resources :suggestions
  resources :local_authorities
  resources :broadcasts
  resources :events
  resources :rooms do
    resources :messages
  end
  resources :businesses
end
