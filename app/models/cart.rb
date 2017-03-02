class Cart < ApplicationRecord
  has_many :order_meals

  def add_meal(meal_id)
    current_order_meal = order_meals.find_by(meal_id: meal_id)
    if current_order_meal
      current_order_meal.quantity += 1
    else
      current_order_meal = order_meals.build(meal_id: meal_id)
    end
    current_order_meal
  end

  def total_price
    order_meals.to_a.sum { |item| item.total_price }
  end
end
