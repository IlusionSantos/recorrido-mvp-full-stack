class MonitoringServicesController < ApplicationController
  before_action :set_monitoring_service, only: %i[ show update destroy ]

  # GET /monitoring_services
  def index
    @monitoring_services = MonitoringService.all

    render json: @monitoring_services
  end

  # GET /monitoring_services/1
  def show
    render json: @monitoring_service
  end

  # POST /monitoring_services
  def create
    @monitoring_service = MonitoringService.new(monitoring_service_params)

    if @monitoring_service.save
      render json: @monitoring_service, status: :created, location: @monitoring_service
    else
      render json: @monitoring_service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /monitoring_services/1
  def update
    if @monitoring_service.update(monitoring_service_params)
      render json: @monitoring_service
    else
      render json: @monitoring_service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /monitoring_services/1
  def destroy
    @monitoring_service.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monitoring_service
      @monitoring_service = MonitoringService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monitoring_service_params
      params.fetch(:monitoring_service, {})
    end
end
