class OrdersController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:create, :new]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    if @cart.order_meals.empty?
      redirect_to meals_path, notice: "Your cart is empty"
      return
    end

    @order = Order.new
  end

  def set_order
  end
end
