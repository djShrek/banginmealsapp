require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  context "#new_order_path" do

    it "requires item in cart" do
      get :new
      # expect to be redriected to meals_path
      # expect flash[:notice] to equal "Your cart is empty"
    end

    
  end
end
