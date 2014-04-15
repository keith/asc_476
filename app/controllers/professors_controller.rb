class ProfessorsController < ApplicationController
  before_action :signed_in_admin, only: [:index, :destroy, :email]
  before_action :set_professor, only: [:show, :edit, :update, :destroy, :email]

  # GET /professors
  def index
    @professors = Professor.all
  end

  # GET /professors/1
  # TODO: Use this action to show all applications waiting their recommendation
  def show
  end

  # GET /professors/1/edit
  def edit
  end

  # PATCH/PUT /professors/1
  def update
    if @professor.update(professor_params)
      redirect_to @professor, notice: 'Professor was successfully updated.'
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
    rescue Errno::ECONNREFUSED
      redirect_to professors_url,
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
end
