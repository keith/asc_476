module SessionsHelper
  def sign_in(user)
    token = User.new_token
    cookies.permanent[:remember_token] = token
    user.update_attribute(:remember_token, User.encrypt(token))
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by_remember_token(token)
  end

  def sign_out
    current_user.update_attribute(:remember_token, nil) if current_user
    cookies.delete(:remember_token)
    self.current_user = nil
  end
end
