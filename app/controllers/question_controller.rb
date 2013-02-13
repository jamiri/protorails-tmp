class QuestionController < ApplicationController

  def rate

    unless request.xhr?
      render :file => "#{Rails.root}/public/404.html", :status => :not_found and return
    end

    question_id = params[:question_id]
    rate_val = params[:rate_val]
    if session['user_id'].present?

      vote = QuestionRating.new
      vote.question_id = question_id
      vote.user_id = session['user_id']
      vote.rating = rate_val

      vote.save

      respond_to do |format|
        format.json { render :json => QuestionRating.where(:question_id => question_id).average("rating").to_s }
      end
    end


  end

  def pagination

    unless request.xhr?
      render :file => "#{Rails.root}/public/404.html", :status => :not_found and return
    end

    lesson_id = params[:lesson_id].to_s
    page = params[:page].to_i

    rows = Question.find(:all,
                         :select => "questions.* , avg(question_ratings.rating) as rating_average",
                         :conditions => ["questions.lesson_id=" + lesson_id],
                         :joins => "left outer join question_ratings ON question_ratings.question_id = questions.id",
                         :group => "questions.id", :offset => 5 * page, :limit => 5)
    render :json => rows.to_json(:include => :user)

  end

  def latest
    not_found('forbidden!') unless request.xhr?

    @questions = Question.latest(5)
  end

  def most_popular
    not_found('forbidden') unless request.xhr?

    @questions = Question.top_rated(5)
  end

end
