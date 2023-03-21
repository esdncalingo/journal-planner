Rails.application.routes.draw do
  devise_for :users
  
  #get 'categories' => "categories#index"
  #get "categories/new" => "categories#new", as: "new_category"
  #post "categories" => "categories#create" , as: "create_category"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resource :categories do
    get ":id/tasks" => "tasks#index"
    get ":id/tasks/new" => "tasks#new",as: "new_tasks"
    post ":id/tasks(.:format)" => "tasks#create", as: "create_tasks"
    get ":id/tasks/:tid" => "tasks#show", as: "show_tasks"
    delete ":id/tasks/tid" => "tasks#delete", as: "delete_tasks"
  end

  
  get 'home' => 'home#index'

  # Defines the root path route ("/")
  root "home#index"
end
