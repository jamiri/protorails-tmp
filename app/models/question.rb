class Question < ActiveRecord::Base
  attr_accessible :question, :answer, :answered_by, :user

  has_many :question_ratings, :foreign_key => 'question_id'

  belongs_to :lesson
  belongs_to :user
end
