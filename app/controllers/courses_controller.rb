class CoursesController < ApplicationController
  before_action :signed_in_admin

  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/new
  def new
    @course = Course.new
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

  # PUT /courses/update_multiple
  def update_multiple
    values = params[:courses]
    @courses = Course.find(values.keys)
    @courses.each do |c|
      attrs = values[c.id.to_s].slice(:hidden, :disabled)
      c.update_attributes(update_params(attrs))
      # TODO: Store falses and return errors for failed saves
      c.save if c.changed?
    end
    redirect_to courses_path, notice: 'Courses updated successfully'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def create_params
      params.require(:course).permit(:designator, :number, :hidden, :disabled)
    end

    def update_params(p)
      p.permit(:hidden, :disabled)
    end
end
