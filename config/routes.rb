Agora::Application.routes.draw do
  root 'users#new'
  resources :users, only: [:new, :create]
  get '/signup', to: "users#new"
end
