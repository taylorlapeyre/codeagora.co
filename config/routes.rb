Agora::Application.routes.draw do
  root 'languages#index'
  
  resources :users,     only: [:create, :destroy]
  resources :sessions,  only: [:create, :destroy]
  resources :languages, only: [:index, :show]

  get '/sign-up',  to: "users#new",        as: 'sign_up'
  get '/sign-in',  to: "sessions#new",     as: 'sign_in'
  get '/sign-out', to: "sessions#destroy", as: 'sign_out'

  get "/auth/:provider/callback" => "sessions#github_login"
end
