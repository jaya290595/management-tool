Rails.application.routes.draw do

  resources :invitations
  root 'accounts#index'
  resources :accounts
  devise_for :users, controllers:{registrations:'users/registrations'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
