# == Schema Information
#
# Table name: blog_posts
#
#  content    :text
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  title      :string(255)
#  updated_at :datetime         not null
#

class BlogPost < ActiveRecord::Base
  attr_accessible :title, :content

  belongs_to :lesson

  has_many :comments, :foreign_key => 'blog_post_id'

  def posted_on
    #TODO: decision: created_at or updated_at?
    created_at
  end
end
