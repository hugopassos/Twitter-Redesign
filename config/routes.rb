Rails.application.routes.draw do
  get 'followings/create'
  get 'followings/destroy'
  get 'opinions/index'
  get 'opinions/new'
  get 'opinions/create'
  root 'static_pages#home'
  get 'sessions/new'
  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get '/home',    to: 'static_pages#home'

  resources :users
  resources :opinions, only: %i[new create]
  resources :followings, only: %i[create destroy]
end
