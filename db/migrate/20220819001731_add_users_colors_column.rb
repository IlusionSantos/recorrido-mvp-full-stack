class AddUsersColorsColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :colors, :string
  end
end
