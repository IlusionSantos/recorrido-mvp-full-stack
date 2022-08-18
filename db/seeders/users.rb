x = 1

5.times do
  entityModel = User.new
  entityModel.first_name = Faker::Name.unique.first_name
  entityModel.last_name = Faker::Name.unique.last_name
  entityModel.role = 'Monitoring'
  x += 1

  entityModel.save!
end

p 'Users loaded successfully'
