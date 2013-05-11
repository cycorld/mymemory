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

require 'test_helper'

class MemoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
