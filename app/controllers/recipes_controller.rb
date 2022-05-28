class RecipesController < ApplicationController
  before_action :authenticate_user!

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

  def generate_list
    redirect_to shopping_list_path(params[:recipe_id])
  end

  def generate
    @quantity = []
    @foods = []
    @recipe_food = RecipeFood.where(recipe_id: params[:recipe_id])
    @recipe_food.each do |recipe_food|
      found = false
      check_recipe_food = Food.find(recipe_food.food_id)
      next if found

      @quantity << [recipe_food.quantity, check_recipe_food.price]
      @foods << check_recipe_food.name
    end
    @total = 0
    @quantity.each do |q|
      @total += q[0] * q[1]
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :preparation_time, :description)
  end
end
