class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  # GET /emails
  def index
    @emails = Email.all
  end

  # GET /emails/1
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  def create
    @email = Email.new(email_params)

    if @email.save
      redirect_to @email, notice: 'Email was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /emails/1
  def update
    if @email.update(email_params)
      redirect_to @email, notice: 'Email was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /emails/1
  def destroy
    @email.destroy
    redirect_to emails_url, notice: 'Email was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def email_params
      params.require(:email).permit(:body, :subject, :reply_to, :identifier)
    end
end
