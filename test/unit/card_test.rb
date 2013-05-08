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

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
