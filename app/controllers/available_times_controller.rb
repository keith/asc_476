class AvailableTimesController < ApplicationController
  before_action :set_available_time, only: [:show, :edit, :update, :destroy]

  # GET /available_times
  def index
    @available_times = AvailableTime.all
  end

  # GET /available_times/1
  def show
  end

  # GET /available_times/new
  def new
    @available_time = AvailableTime.new
  end

  # GET /available_times/1/edit
  def edit
  end

  # POST /available_times
  def create
    @available_time = AvailableTime.new(available_time_params)

    if @available_time.save
      redirect_to @available_time, notice: 'Available time was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /available_times/1
  def update
    if @available_time.update(available_time_params)
      redirect_to @available_time, notice: 'Available time was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /available_times/1
  def destroy
    @available_time.destroy
    redirect_to available_times_url, notice: 'Available time was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_available_time
      @available_time = AvailableTime.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def available_time_params
      params.require(:available_time).permit(:day, :start, :finish)
    end
end
