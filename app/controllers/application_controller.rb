class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found
    render :file => "#{Rails.root}/public/404.html", :status => :not_found
  end

end
