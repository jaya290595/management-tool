Rails.application.routes.draw do
  get 'users/show'

  resources :invitations
  root 'accounts#index'
  resources :accounts
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
