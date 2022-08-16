class AvailabilitySchedulesController < ApplicationController
  before_action :set_availability_schedule, only: %i[ show update destroy ]

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
    @availability_schedule = AvailabilitySchedule.new(availability_schedule_params)

    if @availability_schedule.save
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
      params.fetch(:availability_schedule, {})
    end
end
