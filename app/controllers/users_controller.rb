class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]
  before_action :signed_in_admin, only: [:create, :destroy, :index, :new]
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
      # TODO: Send email to @user with link to set their password and/or with the temporary password created above
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      # TODO: Send email to @user with password reset link
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was deleted successfully.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      if @current_user.admin?
        params.require(:user).permit(:name, :email, :level)
      elsif @current_user == @user
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      else
        raise ArgumentError
      end
    end

    def set_user_admin_or_current
      set_user
      redirect_to signin_path unless admin_or_current
    end

    def admin_or_current
      @current_user.admin? || @current_user == @user
    end
end

