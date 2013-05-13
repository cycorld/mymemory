class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :real_name
      t.integer :student_id
      t.integer :department_id
      t.string :join_link
      t.boolean :activated, :default => false

      t.timestamps
    end
  end
end
