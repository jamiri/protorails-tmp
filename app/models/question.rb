# == Schema Information
#
# Table name: questions
#
#  answer      :string(255)
#  answered_by :string(255)
#  created_at  :datetime         not null
#  id          :integer          not null, primary key
#  lesson_id   :integer
#  question    :string(255)
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Question < ActiveRecord::Base
  attr_accessible :question, :answer, :answered_by, :user

  has_many :question_ratings, :foreign_key => 'question_id'

  belongs_to :lesson
  belongs_to :user

  scope :for_lesson, lambda { |lesson_id|
    where(:lesson_id => lesson_id)
    .select('questions.* , avg(question_ratings.rating) as rating_average')
    .joins('left outer join question_ratings ON question_ratings.question_id = questions.id')
    .group('questions.id')
  }
end
