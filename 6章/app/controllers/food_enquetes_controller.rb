class FoodEnquetesController < ApplicationController
  before_action :set_food_enquete, only: [:show, :edit, :update, :destroy]

  # GET /food_enquetes
  def index
    @food_enquetes = FoodEnquete.all
  end

  # GET /food_enquetes/1
  def show
  end

  # GET /food_enquetes/new
  def new
    @food_enquete = FoodEnquete.new
  end

  # GET /food_enquetes/1/edit
  def edit
  end

  # POST /food_enquetes
  def create
    @food_enquete = FoodEnquete.new(food_enquete_params)

    if @food_enquete.save
      redirect_to @food_enquete, notice: I18n.t('successes.submit', name: @food_enquete.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /food_enquetes/1
  def update
    if @food_enquete.update(food_enquete_params)
      redirect_to @food_enquete, notice: I18n.t('successes.update', name: @food_enquete.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /food_enquetes/1
  def destroy
    @food_enquete.destroy
    redirect_to food_enquetes_url, notice: I18n.t('successes.destroy', name: @food_enquete.model_name.human)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_enquete
      @food_enquete = FoodEnquete.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def food_enquete_params
      params.require(:food_enquete).permit(:name, :mail, :age, :food_id, :score, :request, :present_id)
    end
end
