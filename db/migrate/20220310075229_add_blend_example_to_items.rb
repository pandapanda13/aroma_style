class AddBlendExampleToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :blend_example, :text
  end
end
