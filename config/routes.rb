Rails.application.routes.draw do
  root 'tasks#index'
  get 'search' => 'tasks#search'
  resources :tasks
end
