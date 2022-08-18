# app/services/schedule_logic.rb
class ScheduleLogic
  def initialize(monitoring_schedule_params)
    @monitoring_services_id = monitoring_schedule_params[:monitoring_services_id]
    @week = monitoring_schedule_params[:week]
    @max_available = nil
    @schedules = []
  end

  def saving_schedule
    find_user_with_major_disponibilty
  end

  def find_user_with_major_disponibilty
    day = 1
    while day < 7
      list_users_available = list_by_user_available(day)
      average = average_total_hours(list_users_available.length)
      set_users_with_most_available(list_users_available, average)
      save_hour_by_user(day)
      day += 1
    end
  end

  def set_users_with_most_available(list_users_available, _average)
    list_users_available.each do |user|
      if @max_available.present?
        @max_available = user if @max_available[:available_total] < user[:available_total]
      else
        @max_available = user
      end
    end
  end

  def save_hour_by_user(day = 1)
    contrat = Contrat.find_by(monitoring_services_id: @monitoring_services_id, day: day)
    start_time = contrat.start_hour.strftime('%H').to_i
    end_time = contrat.end_hour.strftime('%H').to_i.zero? ? 24 : contrat.end_hour.strftime('%H').to_i

    while end_time > start_time
      if user_by_hour(day, "#{start_time}:00").present?
        schedule = MonitoringSchedule.find_or_create_by(
          monitoring_services_id: @monitoring_services_id,
          day: day,
          week: @week,
          hour: "#{start_time}:00"
        )
        schedule.update(
          users_id: user_by_hour(day, "#{start_time}:00")
        )
        @schedules.push(schedule)
      end
      start_time += 1
    end
  end

  def list_by_user_available(day = 1)
    User.select(:id).all.map do |user|
      available = AvailabilitySchedule.select(:hour).where(monitoring_services_id: @monitoring_services_id,
                                                           users_id: user.id, day: day, week: @week).reorder(hour: :asc).map do |available|
        available.hour
      end
      {
        available: available,
        available_total: available.length,
        id: user.id
      }
    end
  end

  def user_by_hour(day, hour)
    users = AvailabilitySchedule.select(:id, :users_id).where(monitoring_services_id: @monitoring_services_id, day: day, week: @week,
                                                              hour: hour).reorder(:users_id)

    user_available = nil
    users.each do |user|
      user_available = @max_available[:id] if user.users_id == @max_available[:id]
    end

    user_available = users.first.users_id if users.present? && user_available.blank?
  end

  def hour_available?(day, hour)
    MonitoringSchedule.exists?(monitoring_services_id: @monitoring_services_id, day: day, week: @week,
                               hour: hour)
  end

  def average_total_hours(users)
    service = MonitoringService.find_by(id: @monitoring_services_id)
    service.update(total_hours: total_hours) if service.total_hours.blank?
    average = service.total_hours / users
    average.to_i
  end

  def total_hours
    contrats = Contrat.where(monitoring_services_id: @monitoring_services_id)
    total = 0
    contrats.each do |contrat|
      start_time = contrat.start_hour.strftime('%H').to_i
      end_time = contrat.end_hour.strftime('%H').to_i.zero? ? 24 : contrat.end_hour.strftime('%H').to_i
      total += end_time - start_time
    end
    total
  end

  def schedules_list
    @schedules
  end
end
