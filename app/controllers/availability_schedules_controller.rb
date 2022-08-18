class AvailabilitySchedulesController < ApplicationController
  before_action :set_availability_schedule, only: %i[show update destroy]

  # GET /availability_schedules
  def index
    @availability_schedules = AvailabilitySchedule.all

    render json: @availability_schedules
  end

  # GET /availability_schedules/1
  def show
    render json: @availability_schedule
  end

  # POST /availability_schedules
  def create
    @availability_schedule = nil
    if params[:value]
      @availability_schedule = AvailabilitySchedule.find_or_create_by(
        day: availability_schedule_params[:day],
        week: availability_schedule_params[:week],
        monitoring_services_id: availability_schedule_params[:monitoring_services_id],
        users_id: availability_schedule_params[:users_id],
        hour: availability_schedule_params[:hour]
      )

    else
      @availability_schedule = AvailabilitySchedule.find_by(
        day: availability_schedule_params[:day],
        week: availability_schedule_params[:week],
        monitoring_services_id: availability_schedule_params[:monitoring_services_id],
        users_id: availability_schedule_params[:users_id],
        hour: availability_schedule_params[:hour]
      )

      @availability_schedule = @availability_schedule.destroy if @availability_schedule.present?

    end

    if @availability_schedule.present?
      @availability_schedule = {
        availability_schedule: @availability_schedule,
        line_class: available?(
          @availability_schedule.hour,
          @availability_schedule.week,
          @availability_schedule.monitoring_services_id,
          @availability_schedule.day
        )
      }
    end

    if @availability_schedule
      render json: @availability_schedule, status: :created, location: @availability_schedule
    else
      render json: @availability_schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /availability_schedules/1
  def update
    if @availability_schedule.update(availability_schedule_params)
      render json: @availability_schedule
    else
      render json: @availability_schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /availability_schedules/1
  def destroy
    @availability_schedule.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_availability_schedule
    @availability_schedule = AvailabilitySchedule.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def availability_schedule_params
    params.require(:availability_schedule).permit(:week, :hour, :day, :users_id, :monitoring_services_id)
  end
end
