class CreateLadyBugs < ActiveRecord::Migration
  def change
    create_table :lady_bugs do |t|
      t.integer :log_id
      t.text :content

      t.timestamps null: false
    end
  end
end
