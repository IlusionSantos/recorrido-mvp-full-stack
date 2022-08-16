class CreateContrats < ActiveRecord::Migration[7.0]
  def change
    create_table :contrats do |t|

      t.timestamps
    end
  end
end
