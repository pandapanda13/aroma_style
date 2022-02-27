class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps

      t.integer :customer_id, null: false
      t.string :item_id, null: false
      t.float :rate
      t.text :comment_content
      t.datetime :remember_created_at
      t.datetime :remember_updated_at

    end
  end
end
