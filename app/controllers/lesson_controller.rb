class LessonController < ApplicationController

  def show
    #exception handling required!
    @feedback = Feedback.new
    @suggestion = ContentSuggestion.new
    @user = User.new

    @categories = Category.roots

    @lesson = Lesson.single_show(params[:slug]).first

    unless @lesson.present?
      not_found and return
    end

    @lesson_questions = Question.for_lesson(@lesson.id).limit(5)

    @lesson_questions_cnt = Question.where(:lesson_id => @lesson.id).count

    @microblogs = BlogPost.recent_paged(@lesson.id, 0)

    @lesson_microblogs_cnt = BlogPost.where(:lesson_id => @lesson.id).count
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
