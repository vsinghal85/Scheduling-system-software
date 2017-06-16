Rails.application.routes.draw do
	post '/' => 'events#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :teachers
  devise_for :clients
  resources :events
  root 'visitors#index'


namespace :teachers do
    root to: 'visitor#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
