class CreateDistortions < ActiveRecord::Migration
  def change
    create_table :distortions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
