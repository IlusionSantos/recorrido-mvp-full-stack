class CreateContrats < ActiveRecord::Migration[7.0]
  def change
    create_table :contrats do |t|
      t.integer :day, index: true
      t.time :start_hour
      t.time :end_hour
      t.timestamps
    end

    add_reference :contrats, :monitoring_services, index: true, foreign_key: true
  end
end
