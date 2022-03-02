class ChangeColumnDefaultToCartItems < ActiveRecord::Migration[6.1]
  def change
    change_column_default :cart_items, :selected, from: false, to: nil
  end
end
