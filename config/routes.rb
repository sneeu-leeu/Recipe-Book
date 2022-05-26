Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"

  resources :foods, :recipes, :public_recipes, :shopping_list
end
