class AddAssigneeIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :assignee_id, :integer
    add_index :tasks, :assignee_id
  end
end
