class CreateJoinTableMovieDistributor < ActiveRecord::Migration[5.0]
  def change
    create_join_table :movies, :distributors do |t|
      t.index [:movie_id, :distributor_id]
    end
  end
end
