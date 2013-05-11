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

require 'test_helper'

class SubscribeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
