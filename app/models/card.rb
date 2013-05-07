class Card < ActiveRecord::Base
  attr_accessible :answer, :course_id, :hardness, :question, :rating
end
