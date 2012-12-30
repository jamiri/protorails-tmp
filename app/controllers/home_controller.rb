class HomeController < ApplicationController
  def index
    #@top_lessons = Lesson.top4
    #@lesson_top_rated = Lesson.top_rated_4
  end

  def feedback
    Feedback.new(params[:feedback]).save
    render :nothing => true
  end

  def suggestion

      suggest_object = ContentSuggestion.new(params[:content_suggestion])

      if session["user_name"].present?
        suggest_object.user_id = session["user_id"]
        suggest_object.name = session["user_name"]
        suggest_object.email = User.find(session["user_id"].to_i).mail_address
      end

      if suggest_object.save
        show_message("Your suggestion successfully saved!", :type => :notice)
      else
        show_message("An error occurred, please try again later.", :type => :error)
      end

    redirect_to :action => :index
  end

  def content_suggestion
    @suggestion = ContentSuggestion.new
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
