class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :subject
      t.string :description
      t.integer :user_number, :default => 0
      t.integer :question_number, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end
