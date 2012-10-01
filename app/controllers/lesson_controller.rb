class LessonController < ApplicationController

  def show

     #exception handling required!
    @feedback = Feedback.new
    @suggestion = ContentSuggestion.new
    @user = User.new
    @lesson = Lesson.where(:title => params[:title])
    .includes(:objectives, :references, :category , :lesson_ratings)
    .first

    @categories = Category.where(:parent_id => nil).includes(:sub_categories)

    @lesson_questions = Question.find(:all,
                                      :select => "questions.* , avg(question_ratings.rating) as rating_average",
                                      :conditions => ["questions.lesson_id=" + @lesson.id.to_s],
                                      :joins => "left outer join question_ratings ON question_ratings.question_id = questions.id",
                                      :group => "questions.id",:offset => 0 , :limit => 5)

    @avg_rate = @lesson.lesson_ratings.average("rating")
  end
  def rate

    unless request.xhr?
      render :file => "#{Rails.root}/public/404.html", :status => :not_found and return
    end

    lesson_id = params[:lesson_id]
    rate_val = params[:rate_val]

    vote = LessonRating.new
    vote.lesson_id = lesson_id
    vote.user_id = 1
    vote.rating = rate_val

    vote.save


    respond_to do |format|
      format.json { render :json => LessonRating.where(:lesson_id => lesson_id).average("rating")   }
    end

  end
end
