Rails.application.routes.draw do
  devise_for :users
  
  get 'categories' => "categories#index"
  get "categories/new" => "categories#new", as: "new_category"
  post "categories" => "categories#create" , as: "create_category"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "tasks" => "tasks#index"
  get "tasks/new/:item" => "tasks#new",as: "new_tasks"
  post "tasks" => "tasks#create", as: "create_tasks"

  get 'home' => 'home#index'

  # Defines the root path route ("/")
  root "home#index"
end
