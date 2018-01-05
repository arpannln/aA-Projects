class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  attr_reader :current_user 
  
  helper_method :logged_in?, :require_log_in, :current_user
  
  def log_in_user!(user)
    @current_user = user 
    user.reset_session_token!
    session[:session_token] = user.session_token
  end 
  
  def logged_in? 
    !!current_user
  end 
  
  def require_log_in 
    redirect_to new_session_url unless logged_in?
  end 
  
  def log_out 
    session[:session_token] = nil 
  end 
  
  def current_user 
    @current_user = User.find_by(session_token: session[:session_token])
  end 
end 