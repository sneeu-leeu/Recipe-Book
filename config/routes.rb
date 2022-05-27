Rails.application.routes.draw do
  get 'inventories/index'
  get 'inventories/new'
  get 'inventories/show'
  get 'inventories/create'

  devise_for :users
  root "recipes#index"

  resources :public_recipes, :shopping_list

  resources :foods, only: [:index, :new, :create, :destroy]

  resources :recipes do
    resources :recipe_foods
  end
end
