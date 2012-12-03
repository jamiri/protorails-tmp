module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end

  def captcha_tag
    random_text = Captcha.generate_random_text(15)
    user_name = Protorails::Application.config.captcha_user_name
    render "shared/captcha", :url => "http://image.captchas.net/?client=#{user_name}&random=#{random_text}",
           :random_text => random_text
  end

end
