Rails.application.routes.draw do
  get 'foods/index'
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/update'
  get 'recipe_foods/edit'
  get 'recipe_foods/destroy'
  get 'recipe_food/new'
  get 'recipe_food/create'
  get 'recipe_food/update'
  get 'recipe_food/edit'
  get 'recipe_food/destroy'
  devise_for :users
  root "recipes#index"

  resources :foods, :recipes, :public_recipes, :shopping_list
end
