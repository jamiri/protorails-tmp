class QuestionRating < ActiveRecord::Base
  attr_accessible :rating

  belongs_to :question
  belongs_to :user
end
