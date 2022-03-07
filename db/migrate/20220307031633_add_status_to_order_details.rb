class AddStatusToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :status, :integer, default: 0, null: false
  end
end
