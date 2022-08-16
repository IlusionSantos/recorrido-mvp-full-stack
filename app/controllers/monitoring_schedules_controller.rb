class MonitoringSchedulesController < ApplicationController
  before_action :set_monitoring_schedule, only: %i[ show update destroy ]

  # GET /monitoring_schedules
  def index
    @monitoring_schedules = MonitoringSchedule.all

    render json: @monitoring_schedules
  end

  # GET /monitoring_schedules/1
  def show
    render json: @monitoring_schedule
  end

  # POST /monitoring_schedules
  def create
    @monitoring_schedule = MonitoringSchedule.new(monitoring_schedule_params)

    if @monitoring_schedule.save
      render json: @monitoring_schedule, status: :created, location: @monitoring_schedule
    else
      render json: @monitoring_schedule.errors, status: :unprocessable_entity
    end
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
      params.fetch(:monitoring_schedule, {})
    end
end
