class AddTypeToMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :type, :string
  end
end
