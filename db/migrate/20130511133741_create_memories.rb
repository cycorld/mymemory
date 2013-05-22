class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.integer :course_id
      t.integer :user_id
      t.integer :card_id
      t.integer :grade, :default => 1
      t.integer :know, :default => 0
      t.integer :dont_know, :default => 0

      t.timestamps
    end
  end
end
