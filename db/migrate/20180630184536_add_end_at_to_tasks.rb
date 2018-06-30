class AddEndAtToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :end_at, :datetime, null: false
    add_index  :tasks, :end_at
  end
end
