class AddDefaultColumnToOrderMeals < ActiveRecord::Migration[5.0]
  def change
    change_column :order_meals, :quantity, :integer, :default => 1
  end
end
