class ReportsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :signed_in_admin

  # GET /reports/filter
  def new
    @values = params
  end

  # GET /reports
  def index
    app_params_trimmed = app_params.delete_if {|k, v| v.empty?}
    app_filter = { applicants: app_params_trimmed } unless app_params_trimmed.empty?
    pos_params_trimmed = pos_params_clean
    pos_filter = { positions: pos_params_trimmed } unless pos_params_trimmed.empty?
    @applicants = Applicant.where("name like?", "%#{app_name_param}%").where(app_filter).joins(:positions).where(pos_filter).distinct.page(params[:page]).order(sort_column + ' ' + sort_direction)
  end

  private
    def sort_column
      Applicant.column_names.include?(params[:sort]) ? params[:sort] : 'name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    def app_params
      params.permit(:wuid, :email, :interviewed, :work_study, class_standing: [])
    end

    def app_name_param
      params.permit(:name)[:name]
    end

    def pos_params
      params.permit(referred: [], application_status: [], course_id: [])
    end

    def pos_params_clean
      pos_params.delete_if do |k, v|
        true if v.empty?
        array_blank?(v)
      end
    end

    def array_blank?(array)
      return false unless array.kind_of?(Array)
      array.each do |x|
        return false unless x.blank?
      end

      true
    end
end
