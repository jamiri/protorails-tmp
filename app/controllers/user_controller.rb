class UserController < ApplicationController
  def signup
    # TODO: requires refactoring!

    user = User.new(params[:user])
    user.enable = true

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
    end

    redirect_to :home
  end

  def signout
    session['user_name'] = nil
    redirect_to :home
  end
end
