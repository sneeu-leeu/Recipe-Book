class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def new; end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.valid?
      @inventory.save
      @inventories = Inventory.where(user_id: current_user.id)
    else
      redirect_to new_inventory_path
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_to inventories_path
  end

  private

  def inventory_params
    params_required(:inventory).permit(:name, :description, :user_id)
  end
end
