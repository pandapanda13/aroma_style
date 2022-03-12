class ChangeNotnullToContacts < ActiveRecord::Migration[6.1]
  def change
    def up
     change_column_null :contacts, :email, false
    end

    def down
     change_column_null :contacts, :email, true

    end
  end
end
