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
    ContentSuggestion.new(params[:content_suggestion]).save
    render :nothing => true
  end

  def captcha
    #return if request.xhr?

    random_text = Captcha.generate_random_text(15)
    user_name = Protorails::Application.config.captcha_user_name
    url = "http://image.captchas.net/?client=#{user_name}&random=#{random_text}"
    random_hash = {:url => url, :text => random_text}

    respond_to do |format|
      format.json { render :json => random_hash }
    end


  end

end
