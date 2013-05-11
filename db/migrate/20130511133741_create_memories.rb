class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.integer :course_id
      t.integer :user_id
      t.integer :card_id
      t.integer :grade
      t.integer :know
      t.integer :dont_know

      t.timestamps
    end
  end
end
