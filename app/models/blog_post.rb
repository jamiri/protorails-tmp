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

  scope :recent_paged, lambda { |lesson_id, page|
    where(:lesson_id => lesson_id)
    .includes(:comments => :user)
    .offset(5 * page)
    .limit(5)
  }

  def posted_on
    #TODO: decision: created_at or updated_at?
    created_at
  end
end
