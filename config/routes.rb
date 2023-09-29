Rails.application.routes.draw do
  devise_for :users

 # get '/users'
  get 'users/:user_id/foods', to: 'food#index', as: 'user_foods'
  get 'users/:user_id/foods/new', to: 'food#new', as: 'new_user_food'
  post 'users/:user_id/foods', to: 'food#create', as: 'create_user_food'
  delete 'users/:user_id/foods/:id', to: 'food#destroy', as: 'destroy_user_food'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'users/:user_id/recipes', to: 'recipe#index', as: 'user_recipes'
  get 'users/:user_id/recipes/new', to: 'recipe#new', as: 'new_user_recipe'
  post 'users/:user_id/recipes', to: 'recipe#create', as: 'create_user_recipe'
  get 'users/:user_id/recipes/:id', to: 'recipe#show', as: 'show_user_recipe'
  delete 'users/:user_id/recipes/:id', to: 'recipe#destroy', as: 'destroy_user_recipe'


  # Defines the root path route ("/")
  # root "articles#index"
end
