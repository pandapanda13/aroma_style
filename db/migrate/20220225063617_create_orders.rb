class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps

      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shipping_fee, null: false
      t.integer :bill, null: false
      t.integer :payment, null: false
      t.integer :shipping_status, null: false, default: 0
      t.datetime :remember_created_at
      t.datetime :remember_updated_at
    end
  end
end
