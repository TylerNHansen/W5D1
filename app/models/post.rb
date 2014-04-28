# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Post < ActiveRecord::Base
  belongs_to :user

  has_many :links

  has_many :circle_post_shares
  has_many :circles, through: :circle_post_shares
end
