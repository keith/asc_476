class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by_remember_token(token)
    @current_user.present?
  end

  def logged_in_moderator?
    logged_in? && @current_user.moderator?
  end

  def logged_in_admin?
    logged_in? && @current_user.admin?
  end

  def signed_in_user
    redirect_to signin_path unless logged_in?
  end

  def signed_in_moderator
    redirect_to signin_path unless logged_in_moderator?
  end

  def signed_in_admin
    redirect_to signin_path unless logged_in_admin?
  end
end
