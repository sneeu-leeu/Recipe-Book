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

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(public: params[:public])
      flash[:success] = 'Recipe was successfully updated'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to recipe_path(@recipe)
  end

  def public
    @recipes = Recipe.where(public: true)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe Deleted'
    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :preparation_time, :description)
  end
end
