class MonitoringServicesController < ApplicationController
  before_action :set_monitoring_service, only: %i[show update destroy]

  # GET /monitoring_services
  def index
    @monitoring_services = MonitoringService.all
    @monitoring_services = @monitoring_services.map do |monitoring_service|
      {
        id: monitoring_service.id,
        company_name: monitoring_service.company_name
      }
    end
    @weeks = format_weeks
    render json: { monitoring_services: @monitoring_services, weeks: @weeks }
  end

  # GET /monitoring_services/1
  def show
    today_week = params[:week].present? && params[:week].to_i.positive? ? params[:week].to_i : Time.zone.today.strftime('%U').to_i
    @monitoring_service = {
      contrats: format_monitoring_service(@monitoring_service, today_week)
    }

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
    params.require(:monitoring_service).permit(:company_name, :total_hours)
  end
end
