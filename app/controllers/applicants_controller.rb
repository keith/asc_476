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
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants
  def create
    @applicant = Applicant.new(applicant_params)

    if @applicant.save
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
    # TODO: If applicant doesn't exist this we need to 404?
    def set_applicant
      @applicant = Applicant.find_by_identifier(params[:id])
    end

    def create_or_find_professor(email)
      @professor = Professor.find_or_create_by_email(params[:professor_email])
    end

    # Only allow a trusted parameter "white list" through.
    def applicant_params
      params.require(:applicant).permit(:name, :email, :wuid, :phone_number, :class_standing, :gpa, :comment, :major, :minor, :work_study, positions_attributes: [:course_id, professor_attributes: [:name, :email]], available_times_attributes: [:day, :start, :finish])
    end
end
