class FoodsController < ApplicationController
  def index
    @food = Food.all
  end

  def addFood
    @food =Food.new
  end
end
