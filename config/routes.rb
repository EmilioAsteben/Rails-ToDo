Rails.application.routes.draw do
  

  # resources :project, :path => "projects"
  get "/projects", to: "project#index"
  post "/todos", to: "project#todos"
  patch "/projects/:projectid/todo/:todoid", to: "project#patch"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
