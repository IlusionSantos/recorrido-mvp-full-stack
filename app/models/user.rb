class User < ApplicationRecord
  has_many :availability_schedules
  has_many :monitoring_schedules
end
