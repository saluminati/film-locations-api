class AddLandmarkNameToShootingLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :shooting_locations, :landmark_name,:string, null: false, default: "", limit: 500
  end
end
