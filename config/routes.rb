Agora::Application.routes.draw do
  root 'users#new'

  resources :users,    only: [:create, :destroy]
  resources :sessions, only: [:create, :destroy]
  get '/signup',  to: "users#new"
  get '/signin',  to: "sessions#new"
  get '/signout', to: "sessions#destroy"
end
