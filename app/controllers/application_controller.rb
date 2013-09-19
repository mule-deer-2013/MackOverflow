class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?, :logout

  def current_user
    @current_user ||= User.find_by_id!(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def logout
    session.clear
  end
end
