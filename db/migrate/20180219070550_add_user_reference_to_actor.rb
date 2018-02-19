class AddUserReferenceToActor < ActiveRecord::Migration[5.0]
  def change
    add_reference :actors, :movie, foreign_key: true
  end
end
