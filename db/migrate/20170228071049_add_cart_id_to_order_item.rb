class AddCartIdToOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :order_meals, :cart_id, :integer
  end
end
