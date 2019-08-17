class GymEnquetesController < ApplicationController
  before_action :set_gym_enquete, only: [:show, :edit, :update, :destroy]

  # GET /gym_enquetes
  def index
    @gym_enquetes = GymEnquete.all
  end

  # GET /gym_enquetes/1
  def show
  end

  # GET /gym_enquetes/new
  def new
    @gym_enquete = GymEnquete.new
  end

  # GET /gym_enquetes/1/edit
  def edit
  end

  # POST /gym_enquetes
  def create
    @gym_enquete = GymEnquete.new(gym_enquete_params)

    if @gym_enquete.save
      redirect_to @gym_enquete, notice: I18n.t('successes.submit', name: @gym_enquete.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /gym_enquetes/1
  def update
    if @gym_enquete.update(gym_enquete_params)
      redirect_to @gym_enquete, notice: I18n.t('successes.update', name: @gym_enquete.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /gym_enquetes/1
  def destroy
    @gym_enquete.destroy
    redirect_to gym_enquetes_url, notice: I18n.t('successes.destroy', name: @gym_enquete.model_name.human)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gym_enquete
      @gym_enquete = GymEnquete.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gym_enquete_params
      params.require(:gym_enquete).permit(:name, :mail, :age, :course_id, :score, :request, :present_id)
    end
end
