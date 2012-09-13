class Comment < ActiveRecord::Base
  attr_accessible :comment

  belongs_to :blog_post
  belongs_to :user
end
