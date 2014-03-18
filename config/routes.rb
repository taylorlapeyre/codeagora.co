Agora::Application.routes.draw do
  root 'languages#index'

  resources :users,     only: [:create, :destroy]
  resources :sessions,  only: [:create, :destroy]
  resources :languages, only: [:index, :show] do
  resources :snippets

  get '/signup',  to: "users#new",        as: 'sign_up'
  get '/signin',  to: "sessions#new",     as: 'sign_in'
  get '/signout', to: "sessions#destroy", as: 'sign_out'

  get "/auth/:provider/callback" => "sessions#github_login"
end
