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

require 'slugify'

class Lesson < ActiveRecord::Base
  attr_accessible :title, :description, :script, :audio_file, :video_file, :author, :slug
  belongs_to :category

  has_many :blog_posts, :foreign_key => 'lesson_id', :limit => 5, :include => {:comments => [:user]}
  has_many :objectives, :foreign_key => 'lesson_id'
  has_many :questions, :foreign_key => 'lesson_id', :limit => 5
  has_many :references, :foreign_key => 'lesson_id'
  has_many :lesson_ratings, :foreign_key => 'lesson_id'

  has_and_belongs_to_many :glossary_entries

  scope :top4, order('created_at DESC').limit(4)

  before_create :set_slug

  private
    def set_slug
      self.slug = self.title.slugify
    end
end
