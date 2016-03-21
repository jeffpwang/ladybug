class AddUserIdColumnToLadyBugs < ActiveRecord::Migration
  def change
    add_column :lady_bugs, :user_id, :integer
  end
end
