class User < ActiveRecord::Base
  attr_accessible :activated, :department_id, :join_link, :password_hash, :real_name, :student_id, :username
end
