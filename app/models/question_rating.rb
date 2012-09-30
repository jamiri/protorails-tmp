# == Schema Information
#
# Table name: question_ratings
#
#  created_at  :datetime         not null
#  id          :integer          not null, primary key
#  question_id :integer
#  rating      :integer
#  updated_at  :datetime         not null
#  user_id     :integer
#

class QuestionRating < ActiveRecord::Base
  attr_accessible :rating

  belongs_to :question
  belongs_to :user
end
