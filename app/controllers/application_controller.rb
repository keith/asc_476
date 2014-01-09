class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in?
    token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by_remember_token(token)
    !@current_user.nil?
  end

  def signed_in_user
    if !signed_in?
      redirect_to new_sessions_path
    end
  end

end
