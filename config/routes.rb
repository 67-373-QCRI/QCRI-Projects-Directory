Rails.application.routes.draw do

  get 'search/basic_search'
  get 'home', to: 'home#index', as: :home


  # Resources
  resources :users
  resources :publications
  resources :researchers
  resources :products
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'search/', to: 'search#basic_search', as: :search

  # Defines the root path route ("/")
  root "home#index"
end
