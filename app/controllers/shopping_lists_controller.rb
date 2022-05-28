class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.all
    @food = Food.all
    @total_price = current_user.sum(@recipe.recipe_food.includes([:food]))
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.all
    @food = Food.all
    @total_price = 0
    @recipe_food.each do |food|
      @total_price += food.quantity * food.food.price
    end
  end
end
