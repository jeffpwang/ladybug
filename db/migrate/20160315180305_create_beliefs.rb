class CreateBeliefs < ActiveRecord::Migration
  def change
    create_table :beliefs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
