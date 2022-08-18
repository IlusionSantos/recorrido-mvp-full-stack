class CreateMonitoringServices < ActiveRecord::Migration[7.0]
  def change
    create_table :monitoring_services do |t|
      t.string :company_name, index: true
      t.integer :total_hours
      t.timestamps
    end
  end
end
