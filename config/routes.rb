Rails.application.routes.draw do
  post '/login', to: 'sessions#login'
  post '/signup', to: 'sessions#signup'

  resources :parcels
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
