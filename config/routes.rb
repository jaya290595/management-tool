Rails.application.routes.draw do

  root 'accounts#index'
  resources :accounts
  devise_for :users, controllers:{registrations:'users/registrations'}
  get "accounts/invitation" => 'accounts#invitation', :as => :invitation
  resources :invitations
  	get "checkuser", to:"invitations#checkuser"
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
