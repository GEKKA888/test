class RemovePasswordFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :password, :string
  end
end
