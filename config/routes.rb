Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :statuses
  resources :likes, only: [:create, :destroy]

  get "log_out" => "sessions#destroy", :as => "signout"
  get "log_in" => "sessions#new", :as => "log_in"

  resources :sessions, only: [:new, :create, :destroy]
end
