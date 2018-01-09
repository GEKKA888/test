class AddNameToLabels < ActiveRecord::Migration[5.1]
  def change
    add_column :labels, :name, :string
  end
end
