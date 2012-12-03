
class UserController < ApplicationController
  def signup
    # TODO: requires refactoring!

    user = User.new(params[:user])
    user.enable = true

    unless check_if_captcha_is_correct?(params[:random_text], params[:captcha])
      show_message("Sorry", :type => :error)
      redirect_to :home
    end

    unless user.valid?
      render :nothing => true, :status => 403
    end

    user.save
    render :nothing => true
  end

  def signin
    user_credentials = params[:login]

    user = User.authenticate(user_credentials[:email], user_credentials[:password])

    if user.present? && user.enable?
      session['user_name'] = user.name
      session['user_id'] = user.id
    end

    redirect_to :home
  end

  def signout
    session['user_name'] = nil
    redirect_to :home
  end
end
