# == Schema Information
#
# Table name: lesson_ratings
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  rating     :integer
#  updated_at :datetime         not null
#  user_id    :integer
#

class LessonRating < ActiveRecord::Base
  attr_accessible :rating

  belongs_to :lesson
  belongs_to :user
end
