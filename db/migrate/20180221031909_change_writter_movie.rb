class ChangeWritterMovie < ActiveRecord::Migration[5.0]
  def change
    change_column :movies, :writter, :string, null: true
  end
end
