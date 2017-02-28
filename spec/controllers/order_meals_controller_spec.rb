require 'rails_helper'

RSpec.describe OrderMealsController, type: :controller do
  context "#create" do
    # xit "returns 201" d

    it "creates an order item" do
      meal = Meal.create!(name: "Nom meal", description: "NOMMMMM MEAL", type: "SpecialtyMeal")
      post :create, meal_id: meal.id
      expect(OrderMeal.count).to eq 1
    end

    # it "redirects to cart_path"
  end
end
