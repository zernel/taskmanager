class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :subject
      t.text :description
      t.integer :status_cd
      t.integer :priority_cd
      t.integer :project_id
      t.integer :type_cd

      t.timestamps
    end
  end
end
