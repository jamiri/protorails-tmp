# == Schema Information
#
# Table name: feedbacks
#
#  comment    :string(255)
#  created_at :datetime         not null
#  email      :string(255)
#  id         :integer          not null, primary key
#  subject    :string(255)
#  updated_at :datetime         not null
#  url        :string(255)
#  user_id    :integer
#  user_name  :string(255)
#

class Feedback < ActiveRecord::Base
  attr_accessible :user_name, :email, :subject, :comment, :url

  has_one :user
end
