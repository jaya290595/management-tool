Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/new'

  root 'accounts#index'
  resources :accounts do
    resources :comments
  end
  devise_for :users, controllers:{registrations:'users/registrations'}
  get "accounts/invitation" => 'accounts#invitation', :as => :invitation
  resources :invitations
  get "checkuser", to:"invitations#checkuser"
  resources :teams do
    resources :comments
  end
  post "check", to:"teams#check"
  get "check_member", to: "teams#check_member"
  get "add_member", to:"teams#add_member"

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
