class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_foods_params)
    if @recipe_food.save
      flash[:notice] = 'Food Created Successfully'
    else
      render :new
    end
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(update_params)
      flash[:success] = 'Updated Recipe Food Successfully'
    else
      redirect_to recipe_path(@recipe_food.recipe_id)
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:success] = 'Recipe Foods Removed'
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  private

  def update_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
