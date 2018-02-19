class AddFieldToShootingLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :shooting_locations, :country, :string, null: false, default: "", limit: 100
    add_column :shooting_locations, :city, :string, null: false, default: "", limit: 100
  end
end
