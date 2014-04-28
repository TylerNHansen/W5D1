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

  has_and_belongs_to_many :users

end
