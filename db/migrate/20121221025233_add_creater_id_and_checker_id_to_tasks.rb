class AddCreaterIdAndCheckerIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :creater_id, :integer
    add_column :tasks, :checker_id, :integer
  end
end
