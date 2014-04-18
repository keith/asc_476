class ReportsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # GET /reports/filter
  def new
  end

  # GET /reports
  def index
    @applicants = Applicant.filtered_with_params(params).page(params[:page]).order(sort_column + ' ' + sort_direction)
  end

  private

    def sort_column
      Applicant.column_names.include?(params[:sort]) ? params[:sort] : 'name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end