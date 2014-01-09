class SessionsController < ApplicationController
  # Send to sign in page
  def new
  end

  # Generate token, set it on the user, set the cookie
  def create
    user = User.find_by_email(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      # TODO: redirect somewhere
    else
      flash.now[:error] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy

  end
end
