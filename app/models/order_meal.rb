class OrderMeal < ApplicationRecord
  belongs_to :order
  belongs_to :meal

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  
end
