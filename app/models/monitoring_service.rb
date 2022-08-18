class MonitoringService < ApplicationRecord
  has_many :contrats, class_name: 'Contrat', foreign_key: 'monitoring_services_id'
  has_many :availability_schedules
  has_many :monitoring_schedules
end
