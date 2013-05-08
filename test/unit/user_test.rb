# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  username      :string(255)
#  password_hash :string(255)
#  real_name     :string(255)
#  student_id    :integer
#  department_id :integer
#  join_link     :string(255)
#  activated     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
