class AvailabilitySchedule < ApplicationRecord
  belongs_to :monitoring_service, class_name: 'MonitoringService', foreign_key: 'monitoring_services_id'
  belongs_to :user, class_name: 'User', foreign_key: 'users_id'
end
