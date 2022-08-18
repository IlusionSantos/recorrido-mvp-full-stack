class MonitoringSchedulesController < ApplicationController
  before_action :set_monitoring_schedule, only: %i[show update destroy]

  # GET /monitoring_schedules
  def index
    @monitoring_schedules = MonitoringSchedule.all

    render json: @monitoring_schedules
  end

  # GET /monitoring_schedules/1
  def show
    today_week = params[:week].present? && params[:week].to_i.positive? ? params[:week].to_i : Time.zone.today.strftime('%U').to_i
    monitoring_schedule = MonitoringService.find(params[:id])
    monitoring_schedule = {
      contrats: format_monitoring_service_display(monitoring_schedule, today_week)
    }
    render json: monitoring_schedule
  end

  # POST /monitoring_schedules
  def create
    # @monitoring_schedule = MonitoringSchedule.new(monitoring_schedule_params)

    @monitoring_schedule = ScheduleLogic.new(monitoring_schedule_params)
    @monitoring_schedule.saving_schedule

    render json: @monitoring_schedule.schedules_list.length.positive?, status: :created
  end

  # PATCH/PUT /monitoring_schedules/1
  def update
    if @monitoring_schedule.update(monitoring_schedule_params)
      render json: @monitoring_schedule
    else
      render json: @monitoring_schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /monitoring_schedules/1
  def destroy
    @monitoring_schedule.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_monitoring_schedule
    @monitoring_schedule = MonitoringSchedule.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def monitoring_schedule_params
    params.require(:monitoring_schedule).permit(:week, :hour, :day, :users_id, :monitoring_services_id)
  end
end
