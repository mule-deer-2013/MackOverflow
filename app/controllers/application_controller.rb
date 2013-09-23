class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?, :login, :logout

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
    flash[:notice] = "You have successfully logged out."
    #redirect_to root_url
  end
end
