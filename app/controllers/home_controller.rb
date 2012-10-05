class HomeController < ApplicationController

  def index
    @feedback = Feedback.new
    @suggestion = ContentSuggestion.new
    @user = User.new
    @top_lessons = Lesson.top4
    @categories = Category.roots
  end

  def feedback
    Feedback.new(params[:feedback]).save
    render :nothing => true
  end

  def suggestion
    ContentSuggestion.new(params[:content_suggestion]).save
    render :nothing => true
  end

end
