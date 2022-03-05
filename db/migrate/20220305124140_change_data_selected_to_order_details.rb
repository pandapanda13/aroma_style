class ChangeDataSelectedToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    change_column :order_details, :selected, :string
  end
end
