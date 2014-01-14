class CoursesController < ApplicationController
  before_action :signed_in_admin
  before_action :set_course, only: [:edit, :update]

  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/1
  def show
    redirect_to courses_path
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(create_params)

    if @course.save
      redirect_to courses_path, notice: 'Course was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(update_params)
      redirect_to courses_path, notice: 'Course was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def create_params
      params.require(:course).permit(:designator, :number, :hidden, :disabled)
    end

    def update_params
      params.require(:course).permit(:hidden, :disabled)
    end
end
