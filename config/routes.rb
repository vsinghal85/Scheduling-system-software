Rails.application.routes.draw do
	devise_for :admin, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :teachers
  devise_for :clients
  resources :events
  root 'visitors#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
