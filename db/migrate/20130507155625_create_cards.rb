class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :course_id
      t.string :question
      t.string :answer
      t.integer :hardness
      t.integer :rating

      t.timestamps
    end
  end
end
