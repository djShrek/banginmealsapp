class OrdersController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:create, :new]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def create
    @order = Order.new(order_params)
    @order.add_order_meals_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        # OrderNotifierMailer.received(@order).deliver
        format.html { redirect_to meals_path, notice: "Thank you for your order" }
        format.json { render action: "show", status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    if @cart.order_meals.empty?
      redirect_to meals_path, notice: "Your cart is empty"
      return
    end

    @order = Order.new
  end

  def set_order
  end

  def order_params
    params.require(:order).permit(:name, :email, :phone_number, :street, :city, :zip_code)
  end
end
