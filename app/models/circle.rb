# == Schema Information
#
# Table name: circles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Circle < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user

  has_many :circle_user_memberships

  has_many :friends,
  through: :circle_user_memberships,
  source: :user

  has_many :circle_post_shares
  has_many :posts, through: :circle_post_shares
end
