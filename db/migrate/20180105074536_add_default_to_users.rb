class AddDefaultToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :user_type, 2
  end
end
