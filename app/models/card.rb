# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  question   :string(255)
#  answer     :string(255)
#  hardness   :integer
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Card < ActiveRecord::Base
  attr_accessible :answer, :course_id, :hardness, :question, :rating
    belongs_to :course
end
