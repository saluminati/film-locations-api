class RemoveIndexFromActor < ActiveRecord::Migration[5.0]
  def change
    remove_reference :actors, :movie, index: true, foreign_key: true
  end
end
