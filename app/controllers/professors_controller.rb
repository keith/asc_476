class ProfessorsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :signed_in_admin, only: [:index, :destroy, :email]
  before_action :set_professor, only: [:show, :edit, :update, :destroy, :email]

  # GET /professors
  def index
    @professors = Professor.page(params[:page]).order(sort_column + ' ' + sort_direction)
  end

  # GET /professors/1
  def show
  end

  # GET /professors/1/edit
  def edit
  end

  # PATCH/PUT /professors/1
  def update
    notice  = 'Professor was successfully updated.'
    @professor.assign_attributes(professor_params)
    unless @professor.email.downcase == @professor.email_was.downcase
      begin
        ProfessorMailer.pending_recommendation(self).deliver
      rescue
        notice = "The email address was updated but the notification email failed to send. Please manually send them their URL: #{ professor_url(@professor) }"
      end
    end

    if @professor.save
      redirect_to @professor, notice: notice
    else
      render action: 'edit'
    end
  end

  # DELETE /professors/1
  def destroy
    @professor.destroy
    redirect_to professors_url, notice: 'Professor was successfully destroyed.'
  end

  # POST /professors/1/email
  def email
    begin
      ProfessorMailer.pending_recommendation(@professor).deliver
    rescue
      redirect_to :back,
        notice: "The email failed to send. You can manually send the professor their URL: #{ professor_url(@professor) }"
    else
      redirect_to professors_url, notice: 'The email was sent successfully'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find_by_identifier(params[:id])
      raise ActiveRecord::RecordNotFound.new('Professor not found') if @professor.nil?
    end

    # Only allow a trusted parameter "white list" through.
    def professor_params
      if logged_in_admin?
        params.require(:professor).permit(:name, :email)
      else
        params.require(:professor).permit(:name)
      end
    end

    def sort_column
      Professor.column_names.include?(params[:sort]) ? params[:sort] : 'name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
