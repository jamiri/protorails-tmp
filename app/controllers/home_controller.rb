class HomeController < ApplicationController

  def index
    @feedback = Feedback.new
    @suggestion = ContentSuggestion.new
    @user = User.new
    @top_lessons = Lesson.limit(4).order('created_at').reverse_order
    @categories = Category.where(:parent_id => nil)
  end

  def feedback
    Feedback.new.update_attributes(params[:feedback])
    render :nothing => true
  end

  def suggestion
    ContentSuggestion.new.update_attributes(params[:content_suggestion])
    render :nothing => true
  end

end
