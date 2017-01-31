class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :total
      t.string :email
      t.string :phone_number
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :name
      t.string :status
      t.datetime :fulfilled_at

      t.timestamps
    end
  end
end
