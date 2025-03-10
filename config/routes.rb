Rails.application.routes.draw do
  root to: "tasks#index"
  #resources :tasks, except: [:edit]
  # get "/tasks", to: "tasks#index", as: "tasks"
  # get "/tasks/new", to: "tasks#new", as: "new_task"
  # post "/tasks", to: "tasks#create", as: "create_task"
  patch "/tasks/:id/toggle_completed", to: "tasks#toggle_completed", as: "toggle_completed_task"
  # get "/tasks/:id/edit", to: "tasks#edit", as: "edit_task"
  # get "/tasks/:id", to: "tasks#show", as: "task"

  #I need two routes for my toggle thingy. One for toggle on and one for toggle off
  patch "/tasks/:id", to: "tasks#update", as: "update_task"

  # delete "/tasks/:id", to: "tasks#destroy"

  resources :tasks
end
