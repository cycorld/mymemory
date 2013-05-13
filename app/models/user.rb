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

class User < ActiveRecord::Base

  has_many :subscribes
  attr_accessible :activated, :department_id, :join_link, :password_hash, :real_name, :student_id, :username

  #before_save { |user| user.username = username.downcase }

  #validates :username, presence: true, uniqueness: { case_sensitive: false }
  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password_hash, presence: true

  attr_reader :password

  def password=(pass)
    self.password_hash = Digest::SHA1.hexdigest(pass)
  end

  def verify_password(pass)
    Digest::SHA1.hexdigest(pass) == password_hash
  end

end
