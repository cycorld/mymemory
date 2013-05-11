class Memory < ActiveRecord::Base
  attr_accessible :card_id, :course_id, :dont_know, :grade, :know, :user_id
end
