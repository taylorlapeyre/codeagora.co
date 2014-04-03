Agora::Application.routes.draw do
  root 'snippets#index'

  resources :users,         only: [:create, :destroy, :show]
  resources :sessions,      only: [:create, :destroy]
  resources :languages,     only: [:index, :show]
  resources :comments,      only: [:create]
  resources :notifications, only: [:update]
  resources :snippets

  get '/signup',  to: "users#new",        as: 'sign_up'
  get '/signin',  to: "sessions#new",     as: 'sign_in'
  get '/signout', to: "sessions#destroy", as: 'sign_out'

  get "/auth/:provider/callback" => "sessions#github_login"
end
