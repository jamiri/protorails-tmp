class HomeController < ApplicationController

  def index
    @feedback = Feedback.new
    @suggestion = ContentSuggestion.new
    @user = User.new
    @top_lessons = Lesson.limit(4).order('created_at').reverse_order
    @categories = Category.where(:parent_id => nil)
  end

  def feedback
    @feedback = Feedback.new
    f = params[:feedback]

    @feedback.user_name = f[:user_name]
    @feedback.email = f[:email]
    @feedback.subject = f[:subject]
    @feedback.comment = f[:comment]
    @feedback.url = f[:url]

    @feedback.save if @feedback.valid?
  end

  def suggestion
    @suggestion = ContentSuggestion.new
    s = params[:content_suggestion]

    @suggestion.name = s[:name]
    @suggestion.email = s[:email]
    @suggestion.subject = s[:subject]
    @suggestion.content = s[:content]

    @suggestion.save if @suggestion.valid?
  end

end
