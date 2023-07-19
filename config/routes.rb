Rails.application.routes.draw do
  get 'broadcasts/index'

  root "homes#index"
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :suggestions
  resources :local_authorities
  resources :broadcasts
  
end
