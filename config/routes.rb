Agora::Application.routes.draw do
  root 'languages#index'
  
  resources :users,     only: [:create, :destroy]
  resources :sessions,  only: [:create, :destroy]
  resources :languages, only: [:index, :show]
  get '/signup',  to: "users#new"
  get '/signin',  to: "sessions#new"
  get '/signout', to: "sessions#destroy"
end
