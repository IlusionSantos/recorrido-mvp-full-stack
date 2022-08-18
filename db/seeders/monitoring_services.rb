x = 1

5.times do
  entityModel = MonitoringService.new
  entityModel.company_name = Faker::Company.name
  entityModel.total_hours = 53
  x += 1

  entityModel.save!
end

p 'Monitoring Services loaded successfully'
