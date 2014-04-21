class UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :email]
  before_action :signed_in_admin, only: [:create, :destroy, :index, :new, :email]
  before_action :set_user_admin_or_current, only: [:edit, :update]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.set_temporary_password
    if @user.save
      begin
        @user.send_password_email
      rescue
        redirect_to users_path, notice: 'Email failed to send. Please try again later'
      else
        redirect_to users_path, notice: 'User was successfully created.'
      end
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to applicants_path, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    notice = 'User was deleted successfully.'
    if last_admin?(@user)
      notice = 'Cannot delete the last administrator'
    else
      @user.destroy
    end
    redirect_to users_url, notice: notice
  end

  # POST /users/1/email
  def email
    begin
      @user.set_temporary_password
      @user.send_password_email
    rescue
      redirect_to users_path, notice: "The user's password could not be reset. Please try again later."
    else
      if @user.save
        redirect_to users_path, notice: 'Password reset succesfully. The user will get an email with a temporary password'
      else
        redirect_to users_path, notice: 'User changes could not be saved. Consider deleting and re-creating the user'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      if @current_user == @user
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      elsif @current_user.admin?
        params.require(:user).permit(:name, :email, :level)
      else
        raise ArgumentError
      end
    end

    def last_admin?(user)
      user.admin? && User.where(level: 0).count <= 1
    end

    def set_user_admin_or_current
      set_user
      logged_in_user
      if @current_user.nil?
        redirect_to signin_path
      else
        redirect_to applicants_path unless admin_or_current
      end
    end

    def admin_or_current
      signed_in_user
      @current_user.admin? || @current_user == @user
    end
end
