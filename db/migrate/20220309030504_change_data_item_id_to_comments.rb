class ChangeDataItemIdToComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :item_id, :integer
  end
end
