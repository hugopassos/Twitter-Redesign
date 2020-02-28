Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users
end
