class HomeController < ApplicationController

  def index
    @feedback = Feedback.new
    @suggestion = ContentSuggestion.new
    @user = User.new
    @top_lessons = Lesson.top4
    @categories = Category.roots
    @lesson_top_rated = Lesson.top_rated_4
  end

  def feedback
    Feedback.new(params[:feedback]).save
    render :nothing => true
  end

  def suggestion

    if params[:submit].present?

      suggest_object = ContentSuggestion.new(params[:content_suggestion])

      suggest_object.user_id = session["user_id"] and suggest_object.name = session["user_name"] and suggest_object.email =User.find(session["user_id"].to_i).mail_address if session["user_name"].present?

      begin
        suggest_object.save
        show_message("Your suggestion successfully saved!", :type => :notice)
      rescue => e
        #show_message(e.message, :type => :error)
      end
    end

    redirect_to :action => :index

  end

  def content_suggestion
    @feedback = Feedback.new
    @suggestion = ContentSuggestion.new
    @user = User.new
    @categories = Category.roots
  end


end
