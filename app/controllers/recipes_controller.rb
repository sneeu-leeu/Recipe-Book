class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = 'Recipe successfully created'
    else
      flash[:notice] = 'An error occured, please try again'
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe Deleted'
    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :preperation_time, :description)
  end
end
