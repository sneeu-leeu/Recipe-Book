Rails.application.routes.draw do

  devise_for :users
  root "recipes#index"

  resources :public_recipes, :shopping_list

  resources :foods, only: [:index, :new, :create, :destroy]

  resources :recipes do
    resources :recipe_foods
  end
end
