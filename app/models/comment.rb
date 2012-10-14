# == Schema Information
#
# Table name: comments
#
#  blog_post_id :integer
#  comment      :text
#  created_at   :datetime         not null
#  id           :integer          not null, primary key
#  updated_at   :datetime         not null
#  user_id      :integer
#

class Comment < ActiveRecord::Base
  attr_accessible :comment, :user

  belongs_to :blog_post
  belongs_to :user
end
