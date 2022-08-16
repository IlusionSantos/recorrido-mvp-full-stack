class CreateMonitoringSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :monitoring_schedules do |t|

      t.timestamps
    end
  end
end
