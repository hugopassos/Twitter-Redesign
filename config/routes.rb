Rails.application.routes.draw do
  get 'opinions/new'
  get 'opinions/create'
  root 'static_pages#home'
  get 'sessions/new'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  get '/signup',    to: 'users#new'
  post '/signup',   to: 'users#create'
  get '/home',      to: 'static_pages#home'
  get '/logout',    to: 'sessions#destroy'

  resources :users, except: %i[update destroy]
  resources :opinions, only: %i[new create]
  resources :followings, only: %i[create destroy]
end
