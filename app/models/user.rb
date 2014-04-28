# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  token           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :email, :password_digest, :token, presence: true
  validates :token, uniqueness: true
  has_secure_password validations: false

  has_many :circles,
  through: :circle_user_memberships,
  source: :circle

  has_many :circle_user_memberships



  def reset_token!
    self.token = SecureRandom.urlsafe_base64(16)
    self.save
    self.token
  end

  def to_s
    email
  end

end
