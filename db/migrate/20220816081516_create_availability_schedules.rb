class CreateAvailabilitySchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :availability_schedules do |t|
      t.integer :week, index: true
      t.integer :day, index: true
      t.time :hour
      t.timestamps
    end
    add_reference :availability_schedules, :monitoring_services, index: true, foreign_key: true
    add_reference :availability_schedules, :users, index: true, foreign_key: true
  end
end
