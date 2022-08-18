x = 1

5.times do
  entity_model = Contrat.new
  entity_model.day = 'Lunes'
  entity_model.start_hour = '19:00'
  entity_model.end_hour = '00:00'
  entity_model.monitoring_services_id = x
  x += 1

  entity_model.save!
end

p 'Monday'

x = 1
5.times do
  entity_model = Contrat.new
  entity_model.day = 'Martes'
  entity_model.start_hour = '19:00'
  entity_model.end_hour = '00:00'
  entity_model.monitoring_services_id = x
  x += 1

  entity_model.save!
end

p 'Tuesday'

x = 1
5.times do
  entity_model = Contrat.new
  entity_model.day = 'Miercoles'
  entity_model.start_hour = '19:00'
  entity_model.end_hour = '00:00'
  entity_model.monitoring_services_id = x
  x += 1

  entity_model.save!
end

p 'Wednesday'

x = 1
5.times do
  entity_model = Contrat.new
  entity_model.day = 'Jueves'
  entity_model.start_hour = '19:00'
  entity_model.end_hour = '00:00'
  entity_model.monitoring_services_id = x
  x += 1

  entity_model.save!
end

p 'Thursday'

x = 1
5.times do
  entity_model = Contrat.new
  entity_model.day = 'Viernes'
  entity_model.start_hour = '19:00'
  entity_model.end_hour = '00:00'
  entity_model.monitoring_services_id = x
  x += 1

  entity_model.save!
end

p 'Friday'

x = 1
5.times do
  entity_model = Contrat.new

  entity_model.day = 'Sabado'
  entity_model.start_hour = '10:00'
  entity_model.end_hour = '00:00'
  entity_model.monitoring_services_id = x
  x += 1

  entity_model.save!
end

p 'Saturday'

x = 1
5.times do
  entity_model = Contrat.new
  entity_model.day = 'Domingo'
  entity_model.start_hour = '10:00'
  entity_model.end_hour = '00:00'
  entity_model.monitoring_services_id = x
  x += 1

  entity_model.save!
end

p 'Sunday'

p 'Contracts loaded successfully'
