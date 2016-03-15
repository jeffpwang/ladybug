class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :content
      t.integer :before_rating
      t.integer :after_rating
      t.integer :distortion_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
