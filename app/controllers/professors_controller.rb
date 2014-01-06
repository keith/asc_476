class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]

  # GET /professors
  def index
    @professors = Professor.all
  end

  # GET /professors/1
  def show
  end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit
  end

  # POST /professors
  def create
    @professor = Professor.new(professor_params)

    if @professor.save
      redirect_to @professor, notice: 'Professor was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /professors/1
  def update
    if @professor.update(professor_params)
      redirect_to @professor, notice: 'Professor was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /professors/1
  def destroy
    @professor.destroy
    redirect_to professors_url, notice: 'Professor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def professor_params
      params.require(:professor).permit(:name, :email)
    end
end
