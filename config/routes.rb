Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :statuses
  resources :likes, only: [:create, :destroy]
end
