class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update]

  # GET /positions/1
  def show
  end

  # GET /positions/1/edit
  def edit
  end

  # PATCH/PUT /positions/1
  def update
    if logged_in_admin?
      args = asc_position_params
    else
      args = professor_position_params
    end

    if @position.update(args)
      notice = 'Recommendation was saved successfully'
      unless @position.errors.empty?
        notice = "Email #{ @position.errors[:email].first }"
      end
      redirect_to @position, notice: notice
    else
      render action: 'edit'
    end
  end

  private
    def set_position
      @position = Position.find_by_identifier(params[:id])
    end

    def professor_position_params
      params.require(:position).permit(:professor_comments, :professor_verdict, :professor_taught)
    end

    def asc_position_params
      params.require(:position).permit(:application_status, :professor_comments, :professor_verdict, :professor_taught)
    end
end
