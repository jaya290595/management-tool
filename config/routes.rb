Rails.application.routes.draw do

  root 'accounts#index'
  resources :accounts
  devise_for :users, controllers:{registrations:'users/registrations'}
  get "accounts/invitation" => 'accounts#invitation', :as => :invitation
  resources :invitations
  get "checkuser", to:"invitations#checkuser"
  resources :teams
  post "check", to:"teams#check"
  get "check_member", to: "teams#check_member"
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
