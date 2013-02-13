# == Schema Information
#
# Table name: discussion_posts
#
#  content         :string(255)
#  created_at      :datetime         not null
#  id              :integer          not null, primary key
#  lesson_id       :integer
#  replied_post_id :integer
#  updated_at      :datetime         not null
#  user_id         :integer
#

class DiscussionPost < ActiveRecord::Base
  attr_accessible :content, :lesson_id, :replied_post_id, :user
  belongs_to :user
  belongs_to :lesson

  has_many :replies, :class_name => "DiscussionPost", :foreign_key => :replied_post_id
  belongs_to :replied_post, :class_name => "DiscussionPost"

  scope :root_posts_for, lambda { |lesson_id| where(:replied_post_id => nil, :lesson_id => lesson_id)}

  scope :latest, lambda { |count|
    select('id, content, created_at, user_id')
    includes(:user)
    .order('created_at DESC').limit(count)
  }

end