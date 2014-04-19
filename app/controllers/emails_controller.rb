class EmailsController < ApplicationController
  before_action :signed_in_admin
  before_action :set_email, only: [:show, :edit, :update]

  # GET /emails
  def index
    @emails = Email.all
  end

  # GET /emails/1
  def show
  end

  # GET /emails/1/edit
  def edit
  end

  # PATCH/PUT /emails/1
  def update
    if @email.update(email_params)
      redirect_to @email, notice: 'Email was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def set_email
      @email = Email.find(params[:id])
    end

    def email_params
      params.require(:email).permit(:body, :subject, :reply_to)
    end
end
