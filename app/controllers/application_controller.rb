class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be registered"
      redirect_to sessions_url
    end
  end

  def logged_in?
    !!current_user
  end

  helper_method :current_user
end
