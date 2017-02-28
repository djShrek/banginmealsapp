class OrderMealsController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def create
    meal = Meal.find(params[:meal_id])
    @order_meal = @cart.order_meals.build(meal: meal, quantity: 12)
    respond_to do |format|
      if @order_meal.save
        format.html do
          redirect_to @order_meal.cart, notice: "Order Meal was created."
        end
        format.json { render action: 'show', status: created, location: @order_meal }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
