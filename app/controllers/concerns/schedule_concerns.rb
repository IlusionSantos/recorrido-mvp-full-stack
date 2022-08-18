module ScheduleConcerns
  include ActiveSupport::Concern

  def user_by_hour(monitoring_services_id, week, day, hour)
    MonitoringSchedule.select(:users_id).where(monitoring_services_id: monitoring_services_id, day: day, week: week,
                                               hour: hour)
  end

  def hour_available?(monitoring_services_id, week, day, hour)
    MonitoringSchedule.exists?(monitoring_services_id: monitoring_services_id, day: day, week: week,
                               hour: hour)
  end
end
