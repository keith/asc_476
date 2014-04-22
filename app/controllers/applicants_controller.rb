class ApplicantsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_applicant, only: [:show, :edit, :update, :destroy, :email]
  before_action :signed_in_user, only: [:index, :destroy]

  # GET /applicants
  def index
    @applicants = Applicant.page(params[:page]).order(sort_column + ' ' + sort_direction)
  end

  # GET /applicants/1
  def show
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
    professor = Professor.new
    position = @applicant.positions.build
    position.professor = professor
  end

  # GET /applicants/1/edit
  def edit
  end

  # PATCH/PUT /applicants/1
  def update
    if @applicant.update(applicant_params)
      begin
        @applicant.send_emails(true)
      rescue
        redirect_to @applicant,
          notice: 'The application was updated but the emails failed to send. Contact the ASC for assistance'
      else
        redirect_to @applicant, notice: 'The application was saved succesfully'
      end
    else
      render action: 'edit'
    end
  end

  # POST /applicants
  def create
    positions = applicant_params[:positions_attributes]
    if positions
      positions.each do |arr|
        professor = arr.last[:professor_attributes]
        existing = Professor.find_by_email(professor[:email])
        Professor.create(professor) unless existing
      end
    end

    @applicant = Applicant.new(applicant_params)
    if @applicant.save
      begin
        @applicant.send_emails
      rescue
        redirect_to thanks_path,
          notice: 'The application was saved but the emails failed to send. Contact the ASC for assistance'
      else
        redirect_to thanks_path, notice: 'The application was saved succesfully'
      end
    else
      render action: 'new'
    end
  end

  # DELETE /applicants/1
  def destroy
    @applicant.destroy
    redirect_to applicants_url,
      notice: 'Applicant was successfully deleted.'
  end

  def email
    begin
      @applicant.send_emails
    rescue
      redirect_to @applicant,
        notice: "The email failed to send. You can manually send the applicant their URL: #{ applicant_url(@applicant) }"
    else
      redirect_to @applicant, notice: 'The email was sent successfully'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find_by_identifier(params[:id])
      raise ActiveRecord::RecordNotFound.new('Application not found') if @applicant.nil?
    end

    # Only allow a trusted parameter "white list" through.
    def applicant_params
      params.require(:applicant).permit(:name, :email, :wuid, :phone_number, :class_standing, :gpa, :comment, :major, :minor, :work_study, :interviewed, :asc_comments, positions_attributes: [:course_id, professor_attributes: [:name, :email]])
    end

    def sort_column
      Applicant.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
