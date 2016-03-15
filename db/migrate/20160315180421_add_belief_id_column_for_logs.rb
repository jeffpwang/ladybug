class AddBeliefIdColumnForLogs < ActiveRecord::Migration
  def change
    add_column :logs, :belief_id, :integer
  end
end
