class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @user = current_user
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      flash[:notice] = 'Food created successfully.'
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = 'Food is removed successfully'
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :user_id)
  end
end
