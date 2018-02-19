class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false, default: "", limit: 100
      t.integer :release_year, null: false, default: 0
      t.string :writter, null: false, default: "", limit: 100
      t.timestamps
    end
  end
end
