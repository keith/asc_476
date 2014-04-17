class ReportsController < ApplicationController
  # GET /reports
  def index
    @reports = Report.all
  end
end
