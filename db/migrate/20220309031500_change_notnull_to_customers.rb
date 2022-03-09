class ChangeNotnullToCustomers < ActiveRecord::Migration[6.1]
  def change
    def up
    change_column_null :customers, :nickname, false
    end

    def down
    change_column_null :customers, :nickname, true
    end
  end
end
