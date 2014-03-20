class PositionsController < ApplicationController
  # TODO: Possibly create a unique ID for positions for editing
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  # GET /positions
  def index
    @positions = Position.all
  end

  # GET /positions/1
  def show
  end

  # GET /positions/new
  def new
    @position = Position.new
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  def create
    @position = Position.new(position_params)

    if @position.save
      redirect_to @position, notice: 'Position was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /positions/1
  def update
    args = params
    if logged_in_admin?
      args = asc_position_params
    else
      args = professor_position_params
    end

    if @position.update(args)
      redirect_to @position, notice: 'Position was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /positions/1
  def destroy
    @position.destroy
    redirect_to positions_url, notice: 'Position was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    def professor_position_params
      params.require(:position).permit(:professor_comments, :professor_verdict, :professor_taught)
    end

    def asc_position_params
      params.require(:position).permit(:application_status, :asc_comments)
    end
end
