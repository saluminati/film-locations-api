class AddDirectorToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :director, :string, null: false, default: "", limit: 100
  end
end
