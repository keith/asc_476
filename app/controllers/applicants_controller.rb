class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index]

  # GET /applicants
  def index
    @applicants = Applicant.all
  end

  # GET /applicants/1
  def show
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
    @applicant.available_times.build
    professor = Professor.new
    position = @applicant.positions.build
    position.professor = professor
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants
  def create
    @applicant = Applicant.new(applicant_params)

    @applicant.positions.each do |position|
      professor = Professor.find_by_email(position.professor.email)
      position.professor = professor if professor
    end

    if @applicant.save
      # TODO: Email applicant with info
      redirect_to @applicant, notice: 'Applicant was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /applicants/1
  def update
    if @applicant.update(applicant_params)
      redirect_to @applicant, notice: 'Applicant was successfully updated.'
    else
      render action: 'edit'
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
      params.require(:applicant).permit(:name, :email, :wuid, :phone_number, :class_standing, :gpa, :comment, :major, :minor, :work_study, positions_attributes: [:course_id, professor_attributes: [:name, :email]], available_times_attributes: [:day, :start, :finish])
    end
end
