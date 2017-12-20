class RemoveStateFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :state, :integer
  end
end
