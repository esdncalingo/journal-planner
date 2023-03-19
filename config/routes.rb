Rails.application.routes.draw do
  devise_for :users
  get 'categories' => "categories#index", as: "categories"
  get "categories/new" => "categories#new", as: "new_user"
  post "home" => "categories#create" 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'home' => 'home#index'

  # Defines the root path route ("/")
  root "home#index"
end
