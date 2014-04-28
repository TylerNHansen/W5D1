# == Schema Information
#
# Table name: circle_post_shares
#
#  id         :integer          not null, primary key
#  circle_id  :integer
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class CirclePostShare < ActiveRecord::Base
  belongs_to :circle
  belongs_to :post
end
