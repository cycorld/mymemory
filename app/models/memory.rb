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

  def self.grade_array(user_id, course_id)
    temp = Memory.where(:user_id => user_id, :course_id => course_id)
    a = [0, 0, 0, 0, 0]
    temp.each do |x|
      case x.grade
      when 1
        a[0] += 1
      when 2
        a[1] += 1
      when 3
        a[2] += 1
      when 4
        a[3] += 1
      when 5
        a[4] += 1
      end
    end
    return a
  end
end
