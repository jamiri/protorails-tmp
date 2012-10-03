class UserController < ApplicationController
  def signup
    user = User.new

    user.name = params[:name]
    user.mail_address = params[:mail_address]
    user.password = params[:password]
    user.enable = true

    user.save if user.valid?
    render :nothing => true
  end

  def signin
    user = User.find_by_mail_address_and_password(params[:email], params[:password])

    if user.present? && user.enable
      session['user_name'] = user.name
    end

    redirect_to :home
  end

  def signout
    session['user_name'] = nil
    redirect_to :home
  end
end
