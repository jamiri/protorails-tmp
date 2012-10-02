class QuestionController < ApplicationController

  def  rate

    question_id = params[:question_id]
    rate_val = params[:rate_val]

    vote = QuestionRating.new
    vote.question_id = question_id
    vote.user_id = 1
    vote.rating = rate_val

    vote.save

    respond_to do |format|
      format.json { render :json => QuestionRating.where(:question_id => question_id).average("rating").to_s   }
    end


  end

  def pagination

    lesson_id = params[:lesson_id].to_s
    page = params[:page].to_i

    rows = Question.find(:all,
                         :select => "questions.* , avg(question_ratings.rating) as rating_average",
                         :conditions => ["questions.lesson_id=" + lesson_id],
                         :joins => "left outer join question_ratings ON question_ratings.question_id = questions.id",
                         :group => "questions.id",:offset => 5 * page , :limit => 5)
   render :json => rows.to_json(:include => :user)

  end


end
