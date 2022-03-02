class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.timestamps

      t.integer :item_id, null: false
      t.integer :customer_id, null: false
      t.integer :amount, null: false
      t.string :selected, null: false, default: false
      t.datetime :remember_created_at
      t.datetime :remember_updated_at
    end
  end
end
