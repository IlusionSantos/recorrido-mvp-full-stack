class CreateMonitoringSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :monitoring_schedules do |t|
      t.integer :week, index: true
      t.time :hour
      t.timestamps
    end

    add_reference :monitoring_schedules, :monitoring_services, index: true, foreign_key: true
    add_reference :monitoring_schedules, :users, index: true, foreign_key: true
  end
end
