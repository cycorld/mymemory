class Course < ActiveRecord::Base
  attr_accessible :description, :question_number, :subject, :title, :user_id, :user_number
end
