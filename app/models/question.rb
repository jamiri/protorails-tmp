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
end
