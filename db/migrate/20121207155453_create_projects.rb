class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :overview
      t.string :identifier
      t.integer :status_cd

      t.timestamps
    end
    add_index :projects, :identifier
  end
end
