class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private
  def require_no_user!
    redirect_to cats_url if current_user
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
end
