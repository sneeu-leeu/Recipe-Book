Rails.application.routes.draw do
  get 'shopping_lists/index'
  get 'shopping_lists/show'
  devise_for :users
  root 'foods#index'
  get 'users/index'
  get 'users/sign_out'
  resources :users, only: %i[index]
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    resources :shopping_list, only: [:index ,:show]
  end
  resources :inventories do
    resources :inventory_foods
  end
  put 'recipes/:id/update', to: 'recipes#update', as: 'update'
  post 'shopping_list/recipe_id=:recipe_id', to: 'recipes#generate_list', as: 'generate_shopping_list'
  get 'public_recipes', to: 'recipes#public', as: 'public'
  get 'shopping_list/recipe_id=:recipe_id&inventory_id=:inventory_id', to: 'recipes#generate', as: "shopping_list"
end