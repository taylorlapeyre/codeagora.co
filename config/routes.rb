Agora::Application.routes.draw do
  root 'languages#index'

  namespace :api, constraints: { format: 'json' } do
    resources :languages, only: [:index, :show]
  end

  resources :users,     only: [:create, :destroy]
  resources :sessions,  only: [:create, :destroy]
  resources :languages, only: [:index, :show]

  get '/sign-up',  to: "users#new",        as: 'sign_up'
  get '/sign-in',  to: "sessions#new",     as: 'sign_in'
  get '/sign-out', to: "sessions#destroy", as: 'sign_out'
end
