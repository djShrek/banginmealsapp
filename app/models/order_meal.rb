class OrderMeal < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :meal,  optional: true
  belongs_to :cart,  optional: true

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # deleting cart that has order meals

  # when order meal has order and cart
    # will also delete order meals on the order
      # leads to bad data
        ## therefore we cannot delete order_meals that have an order

  # when order meal has cart but no order
    # will delete order meals that are not associated with an order
      # leads to ok data
        ## we can delete shopping carts order_meals that do not have an order

  # delete shopping cart
    # delete order meals unless order exists

  def total_price
    meal.price * quantity
  end

end
