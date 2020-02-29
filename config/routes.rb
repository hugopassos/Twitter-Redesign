Rails.application.routes.draw do
  get 'sessions/new'
  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get '/home',    to: 'static_pages#home'

  resources :users
end
