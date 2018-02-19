class CreateShootingLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :shooting_locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :fun_facts
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
