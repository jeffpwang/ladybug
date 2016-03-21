class CreateLogLadyBugs < ActiveRecord::Migration
  def change
    create_table :log_lady_bugs do |t|
      t.integer :log_id
      t.integer :lady_bug_id
      t.timestamps null: false
    end
  end
end
