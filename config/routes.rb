Rails.application.routes.draw do
  devise_for :users
  
  #get 'categories' => "categories#index"
  #get "categories/new" => "categories#new", as: "new_category"
  #post "categories" => "categories#create" , as: "create_category"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :categories do
    #get "tasks" => "tasks#index"
    #get "tasks/new" => "tasks#new",as: "new_tasks"
    #post "tasks" => "tasks#create", as: "create_tasks"
    #get "tasks/:tid/edit" => "tasks#edit", as: "edit_tasks"
    #get "tasks/:tid" => "tasks#show", as: "show_tasks"
    #patch "tasks/:tid" => "tasks#update", as: "update_tasks"
    #delete "tasks/tid" => "tasks#delete", as: "delete_tasks"
    resources :tasks
  end

  
  get 'home' => 'home#index'

  # Defines the root path route ("/")
  root "home#index"
end
