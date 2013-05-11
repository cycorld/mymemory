# == Schema Information
#
# Table name: memories
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  user_id    :integer
#  card_id    :integer
#  grade      :integer
#  know       :integer
#  dont_know  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Memory < ActiveRecord::Base
  attr_accessible :card_id, :course_id, :dont_know, :grade, :know, :user_id
  belongs_to :user
  belongs_to :course
  
end
