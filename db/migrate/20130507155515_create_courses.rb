class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :subject
      t.string :description
      t.integer :user_number
      t.integer :question_number
      t.integer :user_id

      t.timestamps
    end
  end
end
