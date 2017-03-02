class Order < ApplicationRecord
  has_many :order_meals

  validates :name, :city, :street, :zip_code, :phone_number, presence: true
end
