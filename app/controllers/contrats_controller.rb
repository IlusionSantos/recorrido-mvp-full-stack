class ContratsController < ApplicationController
  before_action :set_contrat, only: %i[ show update destroy ]

  # GET /contrats
  def index
    @contrats = Contrat.all

    render json: @contrats
  end

  # GET /contrats/1
  def show
    render json: @contrat
  end

  # POST /contrats
  def create
    @contrat = Contrat.new(contrat_params)

    if @contrat.save
      render json: @contrat, status: :created, location: @contrat
    else
      render json: @contrat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contrats/1
  def update
    if @contrat.update(contrat_params)
      render json: @contrat
    else
      render json: @contrat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contrats/1
  def destroy
    @contrat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contrat
      @contrat = Contrat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contrat_params
      params.fetch(:contrat, {})
    end
end
