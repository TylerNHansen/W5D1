# == Schema Information
#
# Table name: circle_user_memberships
#
#  circle_id :integer
#  user_id   :integer
#

class CircleUserMembership < ActiveRecord::Base

  belongs_to :user

  belongs_to :circle

end
