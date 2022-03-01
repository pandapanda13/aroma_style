class AddBlendFlagToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :blend_flag, :boolean, default: false
  end
end
