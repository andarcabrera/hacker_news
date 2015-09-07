class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def session_user
    if session[:user_id]
      @user ||= User.find(session[:user_id])
    end
  end

  def session_user_id
    session_user.id.to_i
  end

  helper_method :session_user
  helper_method :session_user_id
end

