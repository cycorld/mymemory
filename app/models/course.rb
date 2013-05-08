# == Schema Information
#
# Table name: courses
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  subject         :string(255)
#  description     :string(255)
#  user_number     :integer
#  question_number :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Course < ActiveRecord::Base
  attr_accessible :description, :question_number, :subject, :title, :user_id, :user_number
    belongs_to :user
    has_many :card 

end
