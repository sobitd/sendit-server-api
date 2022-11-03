Rails.application.routes.draw do
  mount Motor::Admin=> '/admin'

  resource :users, only: [:create]
  post '/login', to: 'users#login'
  get '/profile', to: 'users#profile'

  resources :parcels
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
