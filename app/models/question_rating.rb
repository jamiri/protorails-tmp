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
  def self.question_user_rated(question_id , user_id)

    rate = find_by_question_id_and_user_id(question_id,user_id)
    if rate.nil?
      return false
    else
      return true
    end

  end
end
