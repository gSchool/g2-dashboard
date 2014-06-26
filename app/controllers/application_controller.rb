class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  helper_method :logged_in?, :current_user, :validate_logged_in


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def validate_logged_in
    redirect_to root_path if !logged_in?
  end

end