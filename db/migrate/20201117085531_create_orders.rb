class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :recipe_name
      t.integer :recipe_price
      t.integer :recipe_quantity

      t.timestamps
    end
  end
end
