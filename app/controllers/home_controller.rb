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

      suggest_object.user_id = session["user_id"] and suggest_object.name = session["user_name"] and suggest_object.email = User.find(session["user_id"].to_i).mail_address if session["user_name"].present?

      begin
        show_message("Your suggestion successfully saved!", :type => :notice) if suggest_object.save
        redirect_to :action => :index
      rescue => e
        #TODO: redirect to error page or show friendly error message from messaging system.Need to design.
        #show_message(e.message, :type => :error)

      end
    else
      redirect_to :action => :index
    end



  end

  def content_suggestion
    @feedback = Feedback.new
    @suggestion = ContentSuggestion.new
    @user = User.new
    @categories = Category.roots
  end


  def captcha
    return unless request.xhr?

    random_text = Captcha.generate_random_text(15)
    user_name = Protorails::Application.config.captcha_user_name
    url = "http://image.captchas.net/?client=#{user_name}&random=#{random_text}"
    random_hash = {:url => url, :text => random_text}

    respond_to do |format|
      format.json { render :json => random_hash }
    end


  end

end
