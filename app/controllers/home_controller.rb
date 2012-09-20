class HomeController < ApplicationController
  def index
    @feedback = Feedback.new
    @suggestion = ContentSuggestion.new
    @user = User.new
    @top_lessons = Lesson.limit(4).order('created_at').reverse_order
    @categories = Category.where(:parent_id => nil)
  end
end
