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

  def self.lesson_user_rated(lesson_id , user_id)

    rate = find_by_lesson_id_and_user_id(lesson_id,user_id)
    if rate.nil?
      return false
    else
      return true
    end

  end
end
