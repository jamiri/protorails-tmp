module QuestionHelper

  def question_user_rated(question_id,user_id)

        QuestionRating.question_user_rated(question_id,user_id)
  end

end
