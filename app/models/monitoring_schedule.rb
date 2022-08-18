class MonitoringSchedule < ApplicationRecord
  belongs_to :monitoring_service, class_name: 'MonitoringService', foreign_key: 'monitoring_services_id'
  belongs_to :users, class_name: 'User'
end
