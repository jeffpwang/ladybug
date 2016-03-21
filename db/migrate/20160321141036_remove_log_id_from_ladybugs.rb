class RemoveLogIdFromLadybugs < ActiveRecord::Migration
  def change
    remove_column(:lady_bugs, :log_id)
  end
end
