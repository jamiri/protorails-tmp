class LessonRating < ActiveRecord::Base
  attr_accessible :rating

  belongs_to :lesson
  belongs_to :user
end
