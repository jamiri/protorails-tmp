class DiscussionPost < ActiveRecord::Base
  attr_accessible :content, :lesson_id, :replied_post_id, :user_id
  belongs_to :user
  belongs_to :lesson

  has_many :replies, :class_name => "DiscussionPost", :foreign_key => :replied_post_id
  belongs_to :replied_post, :class_name => "DiscussionPost"

  scope :root_posts_for, lambda { |lesson_id| where(:replied_post_id => nil, :lesson_id => lesson_id)}

end
