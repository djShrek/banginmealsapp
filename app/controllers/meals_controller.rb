class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find params[:id]
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :status, :price, :type)
  end
end
