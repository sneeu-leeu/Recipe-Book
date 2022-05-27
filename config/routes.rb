Rails.application.routes.draw do

  root "recipes#index"

  resources :users, only: %i[index]
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    resources :shopping_list, only: [:index ,:show]
  end
  resources :inventories do
    resources :inventory_foods
  end
end
