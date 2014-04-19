class CoursesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :signed_in_admin

  # GET /courses
  def index
    sort_text = "#{ sort_column } #{ sort_direction }"
    if sort_column.downcase == 'designator'
      sort_text += ",number #{ sort_direction }"
    end
    @courses = Course.order(sort_text)
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
    failed = []
    @courses = Course.find(values.keys)
    @courses.each do |c|
      attrs = values[c.id.to_s].slice(:hidden, :disabled)
      c.update_attributes(update_params(attrs))
      next unless c.changed?
      if !c.save
        failed << c.full_name
      end
    end
    notice = 'Courses updated successfully'
    if !failed.empty?
      notice = "#{ failed.join(', ') } failed to update"
    end
    redirect_to courses_path, notice: notice
  end

  private
    def create_params
      params.require(:course).permit(:designator, :number, :hidden, :disabled)
    end

    def update_params(p)
      p.permit(:hidden, :disabled)
    end

    def sort_column
      Course.column_names.include?(params[:sort]) ? params[:sort] : 'name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
