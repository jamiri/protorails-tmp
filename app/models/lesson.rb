# == Schema Information
#
# Table name: lessons
#
#  audio_file  :string(255)
#  author      :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  description :string(255)
#  id          :integer          not null, primary key
#  script      :text
#  title       :string(255)
#  updated_at  :datetime         not null
#  video_file  :string(255)
#
#

class Lesson < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged

  attr_accessible :title, :description, :script, :audio_file, :video_file, :author
  belongs_to :category

  has_many :blog_posts, :foreign_key => 'lesson_id', :limit => 5, :include => {:comments => [:user]}
  has_many :objectives, :foreign_key => 'lesson_id'
  has_many :questions, :foreign_key => 'lesson_id', :limit => 5
  has_many :references, :foreign_key => 'lesson_id'
  has_many :lesson_ratings, :foreign_key => 'lesson_id'
  has_many :discussion_posts, :foreign_key => 'lesson_id', :include => :user

  has_and_belongs_to_many :glossary_entries
  has_and_belongs_to_many :tags

  scope :latest, lambda { |count|
    select('id, title, slug, audio_file, image_file, created_at')
    .order('created_at DESC').limit(count)
  }

  scope :top_rated ,lambda { |count|
    joins('LEFT OUTER JOIN lesson_ratings ON lesson_ratings.lesson_id = lessons.id')
    .select('lessons.*, avg(lesson_ratings.rating) as average_rating')
    .group('lessons.id').order('average_rating desc')
    .limit(count)
  }

  scope :single_show, lambda { |slug|
    where(:slug => slug)
    .includes(:objectives, :references, :category)
    .joins('LEFT OUTER JOIN lesson_ratings ON lesson_ratings.lesson_id = lessons.id')
    .select('lessons.*, avg(lesson_ratings.rating) as average_rating')
    .group('lessons.id')
  }



  def should_generate_new_friendly_id?
    new_record?
  end
end
