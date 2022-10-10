Rails.application.routes.draw do
  resources :users
  resources :publications
  resources :researchers
  resources :products
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
