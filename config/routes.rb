Rails.application.routes.draw do
  root 'tasks#index'
  get 'search' => 'tasks#search'
  resources :tasks
  resources :users, only: [:new, :create, :show]
  resources :sessions, only:[:new, :create, :destroy]
end
