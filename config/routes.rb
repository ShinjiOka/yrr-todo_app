Rails.application.routes.draw do
  # get 'site/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: redirect('/todos')

  get 'todos', to: "site#index"
  get 'todos/new', to: 'site#index'
  get 'todos/:id/edit', to: 'site#index'

  namespace :api do
    namespace :v1 do
      delete '/todos/destroy_all', to: 'todos#destory_all'
      resources :todos, only: %i[index show create update destroy]
    end
  end

end
