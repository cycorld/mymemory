class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :activated

      t.timestamps
    end
  end
end
