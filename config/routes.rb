Rails.application.routes.draw do
  resource :users, only: [:create]
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'

  resources :parcels
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
