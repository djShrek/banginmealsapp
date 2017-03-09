class Order < ApplicationRecord
  has_many :order_meals, dependent: :destroy

  validates :name, :city, :street, :zip_code, :phone_number, presence: true

  def add_order_meals_from_cart(cart)
    cart.order_meals.each do |meal|
      meal.cart_id = nil
      order_meals << meal
    end
  end
end
