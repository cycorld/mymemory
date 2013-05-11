# == Schema Information
#
# Table name: subscribes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  course_id  :integer
#  activated  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscribe < ActiveRecord::Base
  attr_accessible :activated, :course_id, :user_id
end
