class AddSelectedToOrdeDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :selected, :integer
  end
end
