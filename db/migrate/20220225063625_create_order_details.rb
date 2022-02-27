class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.timestamps

      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.datetime :remember_created_at
      t.datetime :remember_updated_at
    end
  end
end
