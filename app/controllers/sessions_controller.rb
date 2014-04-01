class SessionsController < ApplicationController
  before_action :redirect_signed_in, only: [:new]
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to applicants_path
    else
      redirect_to signin_path, flash: { alert: 'Invalid email/password' }
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end

  private

    def redirect_signed_in
      if logged_in_admin? || logged_in_moderator?
        # TODO: Where should users go when signed in
        redirect_to applicants_path
      end
    end
end

